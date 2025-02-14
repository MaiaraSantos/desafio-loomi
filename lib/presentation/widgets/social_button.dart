import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi/core/config/theme/app_colors.dart';
import 'package:loomi/core/config/theme/spacements.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const SocialButton({
    required this.iconPath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primary.withAlpha(51),
        ),
        child: Padding(
          padding: EdgeInsets.all(Spacements.M),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
