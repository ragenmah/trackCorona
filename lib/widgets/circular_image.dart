// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:websafe_svg/websafe_svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:websafe_svg/websafe_svg.dart';

class CircularImage extends StatelessWidget {
  String imageUrl;
  CircularImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      allowDrawingOutsideViewBox: true,
    );
    // return WebsafeSvg.network(
    //   imageUrl.trim(),
    //   fit: BoxFit.fitHeight,

    // );
    // return Image(image: Svg(imageUrl));
    // return PhotoView(imageProvider: NetworkImage(imageUrl));
    // return CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       image: DecorationImage(
    //         image: imageProvider,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   placeholder: (context, url) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   errorWidget: (context, url, error) => Container(),
    // );
  }
}
