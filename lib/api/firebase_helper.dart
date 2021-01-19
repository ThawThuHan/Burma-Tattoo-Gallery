import 'package:burma_tattoo_gallery/models/shopCategory_modal.dart';
import 'package:burma_tattoo_gallery/models/shopaddress_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireHelper {
  static final CollectionReference ref =
      FirebaseFirestore.instance.collection('tattoo_shops');
  static final CollectionReference refShopCatagory =
      FirebaseFirestore.instance.collection('shop_catagoies');

  static Future<List<ShopModal>> getShopList(String city) async {
    QuerySnapshot snapshot = await ref.where("city", isEqualTo: city).get();
    return snapshot.docs.map((e) => ShopModal.fromDoc(e)).toList();
  }

  static getShopCategory() {
    Stream<QuerySnapshot> snapshot = refShopCatagory.snapshots();
    return snapshot.map(
        (e) => e.docs.map((item) => ShopCategoryModal.formDoc(item)).toList());
  }
}
