import 'package:flutter/material.dart';

import '../../../../core/config/theme/app_colors.dart';

class SelectableImageButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableImageButton({
    required this.icon,
    this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.primary.withAlpha(51) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.secondaryDarkPurple
                : AppColors.neutralGrayMiddle50,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.secondaryDarkPurple
                  : AppColors.neutralGrayMiddle50,
              size: 32,
            ),
            SizedBox(height: 10),
            Text(
              label ?? '',
              style: TextStyle(
                  color:
                      isSelected ? AppColors.primaryWhite : AppColors.neutralGrayMiddle50,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
