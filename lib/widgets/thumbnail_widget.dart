import 'package:flutter/material.dart';
import 'package:music_info/models/response_thumbnail.dart';

class ThumbnailWidget extends StatelessWidget {
  ThumbnailWidget({Key key, this.thumbnail}) : super(key: key);

  final ResponseThumbnail thumbnail;

  @override
  Widget build(BuildContext context) {
    String imgURL = '';

    // First check if high quality image is available
    if (thumbnail.highQuality == null) {
      // If high quality image is not available, check for standard quality
      if (thumbnail.standard == null) {
        // Return default image
        return Image.asset('assets/images/image-not-available.jpg');
      } else {
        imgURL = thumbnail.standard;
      }
    } else
      imgURL = thumbnail.highQuality;

    // Return thumbnail image
    return Image.network(
      imgURL,
    );
  }
}
