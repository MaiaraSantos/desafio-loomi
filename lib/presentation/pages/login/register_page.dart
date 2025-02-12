import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi/core/config/theme/app_assets.dart';

import '../../../core/config/strings/strings.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_primary_button.dart';
import '../../widgets/social_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                SvgPicture.asset(AppAssets.loomiLogo),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.alreadyHaveAccount,
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        //   Get.toNamed('/login');
                      },
                      child: Text(
                        Strings.signIn,
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  Strings.createAnAccount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  Strings.completeYourAccountRegistration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconPath: AppAssets.googleIcon,
                      onTap: () {},
                    ),
                    SizedBox(width: 20),
                    SocialButton(
                      iconPath: AppAssets.appleIcon,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white54, // Cor da linha
                        thickness: 1, // Espessura
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Espaçamento do texto
                      child: Text(
                        Strings.signUpWith,
                        style: TextStyle(
                          color: Colors.white.withAlpha(204),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white54,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: Strings.email,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  hintText: Strings.password,
                  isPassword: true,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  hintText: Strings.confirmPassword,
                  isPassword: true,
                ),
                SizedBox(height: 25),
                CustomPrimaryButton(
                  text: Strings.createAccount,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
