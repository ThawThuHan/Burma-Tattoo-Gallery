import 'package:burma_tattoo_gallery/services/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api_call.dart';
import '../models/tattoo_model.dart';
import '../screens/myphoto_view.dart';

class TattooGallery extends StatelessWidget {
  final String id;
  final String title;
  int adCount = 0;

  TattooGallery({this.id, this.title});
  @override
  Widget build(BuildContext context) {
    InterstitialAd newInterstitialAd = AdManager.myInterstitial;
    newInterstitialAd.load();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<TattooModel>>(
        future: ApiCall.tattooPhoto(id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<TattooModel> tattooPhotos = snapshot.data;
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: tattooPhotos.length,
            itemBuilder: (context, index) {
              String thumbnail = tattooPhotos[index].thumbnail;
              return GestureDetector(
                onTap: () async {
                  await newInterstitialAd.show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPhotoView(tattooPhotos, index),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: thumbnail == null
                      ? Container()
                      : Image(
                          image: NetworkImage('$thumbnail}'),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
