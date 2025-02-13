import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/strings/strings.dart';
import '../../../../core/config/theme/app_assets.dart';
import '../../../../core/config/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppAssets.loomiSmallLogo,
          colorFilter: ColorFilter.mode(
            AppColors.neutralGrayMiddle70,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 40),
        Text(
          Strings.tellUsMore,
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          Strings.completeYourProfile,
          style: TextStyle(
            color: AppColors.neutralGrayMiddle70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
