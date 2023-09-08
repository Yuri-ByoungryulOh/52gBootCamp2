import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// asdasd
class ImageBox extends StatelessWidget {
  ///asdasd
  const ImageBox(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  /// dasd
  final dynamic src;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  AlignmentGeometry get alignment => Alignment.center;

  @override
  Image build(BuildContext context) {
    if (src is Uint8List) {
      return Image.memory(
        src as Uint8List,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
      );
    } else if ((src as String).contains('http')) {
      return Image.network(
        src as String,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) => const CupertinoActivityIndicator(),
      );
    } else if ((src as String).startsWith('data:')) {
      final imageData = Uri.parse(src as String).data?.contentAsBytes();
      return Image.memory(imageData!, height: height, width: width, fit: fit, alignment: alignment);
    } else {
      return Image.asset(src as String, width: width, height: height, color: color, fit: fit, alignment: alignment);
    }
  }

  ImageProvider<Object> image(BuildContext context) {
    return build(context).image;
  }
}
