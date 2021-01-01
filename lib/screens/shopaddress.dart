import '../items.dart';
import 'package:flutter/material.dart';

class ShopAddress extends StatefulWidget {
  final String city;

  ShopAddress({this.city});

  @override
  _ShopAddressState createState() => _ShopAddressState();
}

class _ShopAddressState extends State<ShopAddress> {
  List<ShopLocation> shops = [];

  @override
  void initState() {
    shopByName();
    super.initState();
  }

  shopByName() {
    shopLocation.forEach((e) {
      if (e.city == widget.city) {
        shops.add(e);
      }
    });
  }

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (shops.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Card(
            child: buildTextColumn(
                shops[index].name, shops[index].address, shops[index].phone),
          );
        },
        itemCount: shops.length,
      ),
    );
  }

  buildTextColumn(String name, String address, String phone) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(
            address,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(
            phone,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
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
