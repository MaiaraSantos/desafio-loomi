import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/app_assets.dart';
import 'package:loomi/core/config/theme/app_colors.dart';

import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/spacements.dart';
import 'widgets/change_pass_modal.dart';
import 'widgets/delete_account_modal.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralBlack,
      appBar: AppBar(
        backgroundColor: AppColors.neutralBlack,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.primary,
          onPressed: Get.back,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                Strings.editProfile,
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0bVGAU1OlTWgDdLzq6RNS-TklEfg8LQoAzg&s"),
                      ),
                    ),
                    SizedBox(width: Spacements.S),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Strings.hello},',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Eva Mendes',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: Spacements.M),
                _buildOptionButton(
                  Strings.changePassword,
                  Icons.security_outlined,
                  () => Get.to(ChangePasswordModal()),
                ),
                SizedBox(height: Spacements.XS),
                _buildOptionButton(
                  Strings.deleteMyAccount,
                  Icons.delete_outline_outlined,
                  () => _showCustomModal(context),
                ),
                SizedBox(height: Spacements.L),
                Text(
                  Strings.subscriptions,
                  style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Spacements.S),
                _buildSubscriptionCard(),
                SizedBox(height: Spacements.M),
                Text(
                  Strings.history,
                  style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildHistoryRow(),
                SizedBox(height: Spacements.XL),
                Center(
                  child: SizedBox(
                    height: 42,
                    width: 110,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryWhite),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        Strings.logOut,
                        style: TextStyle(color: AppColors.primaryWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    String text,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: AppColors.primaryWhite,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.primaryWhite,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.primaryWhite,
        size: 16,
      ),
      tileColor: AppColors.primaryWhite.withAlpha(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSubscriptionCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(Spacements.XS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                  color: AppColors.secondaryDarkPurpleStrong,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.all(20),
                child: SvgPicture.asset(AppAssets.loomiSmallLogo,
                    colorFilter: ColorFilter.mode(
                      AppColors.secondaryDarkPurple,
                      BlendMode.srcIn,
                    )),
              ),
              SizedBox(width: Spacements.S),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.streamPremium,
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Jan 22, 2023",
                    style: TextStyle(
                      color: AppColors.neutralGrayMiddle,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              Strings.comingSoon,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryRow() {
    return Row(
      children: [
        Expanded(
          child: _buildHistoryItem(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6Om-40j2zVnOUbcRr2Ys2BPv-mWlJqP2SVw&s',
            "Barbie",
            "2023",
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _buildHistoryItem(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6nGMtCDBS1-EhmRO-2ISJgZ1P8gEoLa2m9RSzX_2qE5U-PwSvlWXH_eKgSvmmcbrK9ik&usqp=CAU',
            "Everything Everywhere All at Once",
            "2022",
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(String imageUrl, String title, String year) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.neutralBlack.withAlpha(225),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: Spacements.XXS),
                Text(
                  "•",
                  style: TextStyle(
                      color: AppColors.neutralGrayMiddle,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: Spacements.XXS),
                Text(
                  year,
                  style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCustomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DeleteAccountModal();
      },
    );
  }
}
