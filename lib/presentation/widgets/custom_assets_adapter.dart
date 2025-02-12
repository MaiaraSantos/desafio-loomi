import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/config/theme/app_assets.dart';

class CustomAssetAdapter extends StatelessWidget {
  final Key? key;
  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;
  final bool isSelected;
  final BoxFit fit;

  const CustomAssetAdapter(
    this.assetPath, {
    this.key,
    this.height,
    this.width,
    this.color,
    this.isSelected = false,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (assetPath.isEmpty) return SizedBox.shrink();

    final isSvg = assetPath.endsWith(AppAssets.extensionSvg);

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        height: height,
        width: width,
        fit: fit,
        color: isSelected ? Colors.white : color,
      );
    }

    return Image.asset(
      assetPath,
      height: height,
      width: width,
      fit: fit,
      color: isSelected ? Colors.white : color,
    );
  }
}
