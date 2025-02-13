import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:loomi/presentation/widgets/cutom_primary_button.dart';
import 'package:loomi/presentation/controllers/movie_controller.dart';

import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find<MovieController>();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBlurredBackground(),
            _buildContent(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return Positioned.fill(
      child: Obx(() {
        if (Get.find<MovieController>().isLoading.value) {
          return Container(color: Colors.black);
        }
        final movie = Get.find<MovieController>().movies.first;
        return ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.posterUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildContent(BuildContext context, MovieController controller) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            SizedBox(height: 20),
            Text(
              "Now Showing",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              final movie = controller.movies.first;
              return _buildMovieCard(context, movie);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, movie) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(movie.posterUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.neutralBlackProcess.withAlpha(150),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${movie.title}",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              movie.description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomPrimaryButton(
                text: 'Watch',
                onPressed: () {},
              ),
            ),
            SizedBox(height: 40),
            Divider(color: Colors.white70),
            SizedBox(height: 20),
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
            )
          ],
        ),
      ),
    );
  }
}
