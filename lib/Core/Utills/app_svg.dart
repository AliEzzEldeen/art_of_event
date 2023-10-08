import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVG extends StatefulWidget {
  const AppSVG({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  State<AppSVG> createState() => _AppSVGState();
}

class _AppSVGState extends State<AppSVG> {
  @override
  Widget build(BuildContext context) {
    String assetPath = widget.assetName;
    if (!assetPath.contains('images')) {
      assetPath = "assets/images/$assetPath.svg";
    }

    return SvgPicture.asset(
      assetPath,
      height: widget.height,
      width: widget.width,
      color: widget.color,
    );
  }
}