import 'package:flutter/material.dart';
import 'package:loomi/core/config/theme/app_colors.dart';

import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_primary_button.dart';
import 'widgets/image_picker_modal.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_image_picker.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileHeader(),
                  ProfileImagePicker(
                    onTap: () => _showImagePickerModal(context),
                  ),
                  CustomTextField(hintText: "Your name"),
                  Column(
                    children: [
                      CustomPrimaryButton(
                        text: "Continue",
                        onPressed: () {},
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: AppColors.secondaryDarkPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return ImagePickerModal(
          onCameraTap: () {
            // Implementar captura de foto
            Navigator.pop(context);
          },
          onGalleryTap: () {
            // Implementar seleção da galeria
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
