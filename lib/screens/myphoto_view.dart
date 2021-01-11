import 'package:burma_tattoo_gallery/services/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import '../api/api_call.dart';
import '../models/tattoo_model.dart';

class MyPhotoView extends StatefulWidget {
  final int indexPage;
  final List<TattooModel> tattoos;

  MyPhotoView(this.tattoos, this.indexPage);

  @override
  _MyPhotoViewState createState() => _MyPhotoViewState();
}

class _MyPhotoViewState extends State<MyPhotoView> {
  PageController _pageController;

  permissionHandle() async {
    PermissionStatus status = await Permission.storage.request();
    return status;
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.indexPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.tattoos.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 24.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          PermissionStatus status = await permissionHandle();
                          if (status.isGranted) {
                            ApiCall.downloadFile(widget.tattoos[index].imgUrl);
                            SnackBar snackbar =
                                SnackBar(content: Text("Photo Saved!"));
                            Scaffold.of(context).showSnackBar(snackbar);
                          }
                        },
                        child: Text('Save'))
                  ],
                ),
                Expanded(
                  child: PhotoView(
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 1.8,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: NetworkImage(widget.tattoos[index].imgUrl),
                  ),
                ),
              ],
            ),
          );
        }, // itemCount: ,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
