import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          color: Color(0xFFBC4CF1).withAlpha(51),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
