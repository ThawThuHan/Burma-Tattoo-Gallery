import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/categories_model.dart';
import 'tattoo_gallery.dart';

class ShowCategories extends StatelessWidget {
  final List<CategoryModel> categories;

  ShowCategories(this.categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            String name = categories[index].name;
            String imgUrl = categories[index].imgUrl;
            String id = categories[index].id.toString();
            return buildLabelWithImage(name, imgUrl, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TattooGallery(
                    id: id,
                    title: name,
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  GestureDetector buildLabelWithImage(String name, String imgUrl,
      {Function onTap, bool isImageFile = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 8.0, right: 4.0, top: 8.0),
        // width: 100.0,
        // height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: isImageFile
                ? AssetImage(imgUrl)
                : CachedNetworkImageProvider(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              name.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.badScript(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
