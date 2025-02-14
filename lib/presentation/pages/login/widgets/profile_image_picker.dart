import 'package:flutter/material.dart';

import '../../../../core/config/strings/strings.dart';
import '../../../../core/config/theme/app_colors.dart';

class ProfileImagePicker extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileImagePicker({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.primary.withAlpha(51),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.secondaryDarkPurple,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.chooseImage.toUpperCase(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Text(
                Strings.aSquareImage,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
