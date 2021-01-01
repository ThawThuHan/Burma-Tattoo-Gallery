import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:ext_storage/ext_storage.dart';
import '../models/categories_model.dart';
import '../models/shopaddress_modal.dart';
import '../models/tattoo_model.dart';

class ApiCall {
  static Future<List<CategoryModel>> getData() async {
    http.Response response =
        await http.get("https://movie7plus.me/wp-json/wp/v2/categories/");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<CategoryModel> category = [];
      data.forEach((e) {
        category.add(CategoryModel.fromJson(e));
      });
      return category;
    }
    return null;
  }

  static Future<List<TattooModel>> tattooPhoto(String id) async {
    http.Response response =
        await http.get("https://movie7plus.me/wp-json/wl/v1/cat/$id");
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<TattooModel> tattooPhoto = [];
      data.forEach((e) {
        tattooPhoto.add(TattooModel.fromJson(e));
      });
      return tattooPhoto;
    }
    return null;
  }

  static Future<List<ShopModal>> getAddress(String city) async {
    http.Response response = await http.get(
        "https://5fdb5b8691f19e00173342e8.mockapi.io/api/v1/tattooshops?city=$city");
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<ShopModal> addresses = [];
      data.forEach((e) {
        addresses.add(ShopModal.fromJson(e));
      });
      return addresses;
    }
    return null;
  }

  static downloadFile(String imgUrl) async {
    String filename = Uuid().v1();
    String path = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
    http.Response response = await http.get(imgUrl);
    var bytes = response.bodyBytes;
    File file = File('$path/$filename.jpg');
    await file.writeAsBytes(bytes);
    return file;
  }
}
