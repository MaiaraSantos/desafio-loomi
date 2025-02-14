import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/spacements.dart';
import 'package:loomi/presentation/widgets/custom_text_field.dart';

import '../../../../core/config/strings/strings.dart';
import '../../../../core/config/theme/app_colors.dart';

class ChangePasswordModal extends StatelessWidget {
  const ChangePasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralBlack,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.primary,
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.changePassword,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryWhite,
              ),
            ),
            _buildPasswordField(Strings.currentPassword),
            Divider(),
            Column(
              children: [
                _buildPasswordField(Strings.newPassword),
                SizedBox(height: Spacements.S),
                _buildPasswordField(Strings.confirmNewPassword),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(Strings.updatePassword),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String hint) {
    return CustomTextField(
      hintText: hint,
      keyboardType: TextInputType.text,
      isPassword: true,
    );
  }
}
