import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

import 'package:loomi/presentation/widgets/cutom_primary_button.dart';

import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/spacements.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBlurredBackground(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return Positioned.fill(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://untold-strapi-prod.s3.amazonaws.com/large_Down_From_The_Clouds_7aa091f3d7.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Spacements.S),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                SvgPicture.asset(AppAssets.loomiSmallLogo),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0bVGAU1OlTWgDdLzq6RNS-TklEfg8LQoAzg&s"),
                ),
              ],
            ),
            SizedBox(height: Spacements.M),
            Text(
              Strings.nowShowing,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryWhite,
              ),
            ),
            SizedBox(height: Spacements.S),
            _buildMovieCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacements.S),
        image: DecorationImage(
          image: NetworkImage(
              'https://untold-strapi-prod.s3.amazonaws.com/large_Down_From_The_Clouds_7aa091f3d7.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(Spacements.S),
        decoration: BoxDecoration(
          color: AppColors.neutralBlackProcess.withAlpha(150),
          borderRadius: BorderRadius.circular(Spacements.S),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Musical",
              style: TextStyle(
                color: AppColors.neutralGrayMiddle50,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Barbie',
              style: TextStyle(
                fontSize: 32,
                color: AppColors.primaryWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent accumsan in quam id faucibus. Quisque nulla est',
              style: TextStyle(
                color: AppColors.neutralGrayMiddle50,
                fontSize: 14,
              ),
            ),
            SizedBox(height: Spacements.M),
            Text(
              'Comments 3.333',
              style: TextStyle(
                color: AppColors.neutralGrayMiddle50,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet...',
              style: TextStyle(
                color: AppColors.neutralGrayMiddle50,
                fontSize: 12,
              ),
            ),
            SizedBox(height: Spacements.XL),
            Center(
              child: CustomPrimaryButton(
                text: Strings.watch,
                onPressed: () {},
              ),
            ),
            SizedBox(height: Spacements.XL),
            Divider(color: AppColors.neutralGrayMiddle),
            SizedBox(height: Spacements.M),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 18,
                    ),
                    Text(
                      'Fev 29, 2023',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  children: [
                    Icon(
                      Icons.send_outlined,
                      size: 18,
                    ),
                    Text(
                      'Fev 29, 2023',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Strings.avaiableUntil,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Fev 29, 2023',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryDarkPurple,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
