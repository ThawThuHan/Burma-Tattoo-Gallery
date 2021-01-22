import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ADPhotoView extends StatelessWidget {
  final String e;

  ADPhotoView(this.e);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 1.8,
        initialScale: PhotoViewComputedScale.contained,
        imageProvider: AssetImage(e),
      ),
    );
  }
}
