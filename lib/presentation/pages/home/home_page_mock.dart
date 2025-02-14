import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi/presentation/pages/profile/profile_page.dart';

import 'package:loomi/presentation/widgets/cutom_primary_button.dart';

import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/spacements.dart';

class HomePageMock extends StatelessWidget {
  const HomePageMock({super.key});

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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/en/8/8a/Dune_%282021_film%29.jpg"), // 🔹 Mock de imagem
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Spacements.S),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            SizedBox(height: Spacements.M),
            Text(
              Strings.nowShowing,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryWhite,
              ),
            ),
            SizedBox(height: 15),
            _buildMovieCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
  ) {
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
          color: AppColors.neutralBlack.withAlpha(150),
          borderRadius: BorderRadius.circular(Spacements.S),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MovieInfoSection(),
            SizedBox(height: Spacements.M),
            CommentsSection(),
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
            MovieFooter(),
          ],
        ),
      ),
    );
  }
}

class MovieFooter extends StatelessWidget {
  const MovieFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              'Available until',
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
    );
  }
}

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments 3.333',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet...',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Musical",
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Spacements.XS),
        Text(
          'Barbie',
          style: TextStyle(
            fontSize: 32,
            color: AppColors.primaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Spacements.XS),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent accumsan in quam id faucibus. Quisque nulla est',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        SvgPicture.asset(AppAssets.loomiSmallLogo),
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0bVGAU1OlTWgDdLzq6RNS-TklEfg8LQoAzg&s"),
          ),
          onTap: ()=>  Get.to(ProfilePage()),
        ),
      ],
    );
  }
}
