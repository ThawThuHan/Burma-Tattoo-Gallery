import 'package:burma_tattoo_gallery/api/firebase_helper.dart';
import 'package:burma_tattoo_gallery/models/shopaddress_modal.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class ShopAddress extends StatefulWidget {
  final String city;

  ShopAddress({this.city});

  @override
  _ShopAddressState createState() => _ShopAddressState();
}

class _ShopAddressState extends State<ShopAddress> {
  // List<ShopLocation> shops = [];

  // @override
  // void initState() {
  //   shopByName();
  //   super.initState();
  // }

  // shopByName() {
  //   shopLocation.forEach((e) {
  //     if (e.city == widget.city) {
  //       shops.add(e);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '${widget.city}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<ShopModal>>(
          future: FireHelper.getShopList(widget.city.toLowerCase()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<ShopModal> shopList = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final shop = shopList[index];
                return Card(
                  elevation: 4.0,
                  color: Colors.white70,
                  child: buildTextColumn(shop.name, shop.address, shop.phone),
                );
              },
              itemCount: shopList.length,
            );
          }),
    );
  }

  buildTextColumn(String name, String address, String phone) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.tauri(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              address,
              style: GoogleFonts.deliusSwashCaps(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Text(
            phone,
            style: GoogleFonts.deliusSwashCaps(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

// FutureBuilder<List<ShopModal>>(
// future: ApiCall.getAddress(widget.city),
// builder: (context, snapshot) {
// if (!snapshot.hasData) {
// return Center(
// child: CircularProgressIndicator(),
// );
// }
// List<ShopModal> addresses = snapshot.data;
// List<Widget> children = addresses.map((e) {
// return ListTile(
// title: Text(
// '${e.name}',
// style: TextStyle(
// fontSize: 20.0,
// ),
// ),
// subtitle: Text(
// '${e.address}',
// style: TextStyle(
// fontSize: 16.0,
// ),
// ),
// );
// }).toList();
// return ListView(
// children: children,
// );
// },
// )
