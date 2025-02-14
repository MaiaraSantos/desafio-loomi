import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi/presentation/pages/profile/profile_page.dart';
import 'package:loomi/presentation/widgets/cutom_primary_button.dart';
import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/spacements.dart';
import '../../../domain/entities/movie.dart';
import '../../controllers/movie_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find<MovieController>();

    return Scaffold(
      body: Stack(
        children: [
          _buildBlurredBackground(controller),
          _buildContent(context, controller),
        ],
      ),
    );
  }

  Widget _buildBlurredBackground(MovieController controller) {
    return Positioned.fill(
      child: Obx(() {
        if (controller.isLoading.value || controller.movies.isEmpty) {
          return Container(color: AppColors.neutralBlack);
        }
        final movie = controller.movies.first;
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
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.movies.isEmpty) {
                  return Center(
                    child: Text(
                      Strings.noMoviesAvailable,
                      style: TextStyle(color: AppColors.primaryWhite),
                    ),
                  );
                }
                return _buildMoviesList(controller.movies);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesList(List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return _buildMovieCard(context, movies[index]);
      },
    );
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
    return Container(
      margin: EdgeInsets.only(bottom: Spacements.L),
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacements.S),
        image: DecorationImage(
          image: NetworkImage(movie.posterUrl),
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
            MovieInfoSection(movie: movie),
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

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
          onTap: () => Get.to(ProfilePage()),
        ),
      ],
    );
  }
}

class MovieInfoSection extends StatelessWidget {
  final Movie movie;

  const MovieInfoSection({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gênero',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Spacements.XS),
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 32,
            color: AppColors.primaryWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Spacements.XS),
        Text(
          movie.description,
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comentários (3.333)',
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

class MovieFooter extends StatelessWidget {
  const MovieFooter({super.key});

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
              Strings.avaiableUntil,
              style: TextStyle(fontSize: 12),
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
