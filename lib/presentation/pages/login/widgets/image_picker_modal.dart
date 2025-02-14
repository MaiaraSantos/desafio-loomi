import 'package:flutter/material.dart';

import '../../../../core/config/strings/strings.dart';
import '../../../../core/config/theme/app_colors.dart';
import 'selectable_image_button.dart';

class ImagePickerModal extends StatefulWidget {
  const ImagePickerModal({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });
  
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  @override
  State<ImagePickerModal> createState() => _ImagePickerModalState();
}

class _ImagePickerModalState extends State<ImagePickerModal> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.neutralBlack,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: AppColors.secondaryDarkPurple),
                onPressed: () => Navigator.pop(context),
              ),
              Spacer(),
              Text(
                Strings.chooseImage.toUpperCase(),
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableImageButton(
                icon: Icons.camera_alt_outlined,
                label: Strings.takePhoto,
                isSelected: selectedOption == 'camera',
                onTap: () {
                  selectOption('camera');
                  widget.onCameraTap();
                },
              ),
              SizedBox(width: 20),
              SelectableImageButton(
                icon: Icons.photo_library,
                label: Strings.chooseFromGallery,
                isSelected: selectedOption == 'gallery',
                onTap: () {
                  selectOption('gallery');
                  widget.onGalleryTap();
                },
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }
}
