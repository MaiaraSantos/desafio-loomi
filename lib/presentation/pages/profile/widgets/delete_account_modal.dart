import 'package:flutter/material.dart';

import '../../../../core/config/strings/strings.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/spacements.dart';

class DeleteAccountModal extends StatelessWidget {
  const DeleteAccountModal({super.key});

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
                Strings.warning,
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
          Column(
            children: [
              Text(
                Strings.areYouSureDeleteAccount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: Spacements.S),
              Text(
                Strings.thisActionIsIrreversible,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(Strings.cancel),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(Strings.deleteAccount),
              ),
            ],
          )
        ],
      ),
    );
  }
}
