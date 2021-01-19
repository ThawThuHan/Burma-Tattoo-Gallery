import 'package:cloud_firestore/cloud_firestore.dart';

class ShopCategoryModal {
  String id;
  String name;
  String imgUrl;

  ShopCategoryModal({this.id, this.name, this.imgUrl});

  factory ShopCategoryModal.formDoc(QueryDocumentSnapshot doc){
    return ShopCategoryModal(
      id: doc.id,
      name: doc.data()['name'],
      imgUrl: doc.data()['imgUrl'],
    );
  }
}