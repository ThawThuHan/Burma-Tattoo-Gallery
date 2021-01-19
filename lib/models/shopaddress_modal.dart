import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModal {
  String id;
  String name;
  String address;
  String city;
  String phone;

  ShopModal({this.id, this.name, this.address, this.city, this.phone});

  factory ShopModal.fromDoc(QueryDocumentSnapshot doc) {
    final data = doc.data();
    return ShopModal(
        id: doc.id,
        name: data['name'],
        address: data['address'],
        city: data['city'],
        phone: data['phone']);
  }
}
