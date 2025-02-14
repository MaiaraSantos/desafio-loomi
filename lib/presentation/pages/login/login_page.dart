import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/app_assets.dart';
import 'package:loomi/core/config/theme/app_colors.dart';
import 'package:loomi/core/config/theme/spacements.dart';
import '../../controllers/auth_controller.dart';
import '../../../core/config/strings/strings.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_primary_button.dart';
import '../../widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacements.M),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: Spacements.M),
                  SvgPicture.asset(AppAssets.loomiSmallLogo),
                  SizedBox(height: Spacements.XL),
                  Text(
                    Strings.welcomeBack,
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Spacements.XS),
                  Text(
                    Strings.lookWhoIsHere,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.neutralGrayMiddle,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextField(
                    controller: emailController,
                    hintText: Strings.email,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: Spacements.S),
                  CustomTextField(
                    controller: passwordController,
                    hintText: Strings.password,
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: Spacements.XS),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implementar recuperação de senha
                    },
                    child: Text(
                      Strings.forgotPassword,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              CustomPrimaryButton(
                text: Strings.signIn,
                onPressed: () {
                  authController.loginWithEmail(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.neutralGrayMiddle,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      Strings.signUpWith,
                      style: TextStyle(
                        color: AppColors.primaryWhite.withAlpha(204),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.neutralGrayMiddle,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    iconPath: AppAssets.googleIcon,
                    onTap: () {
                      authController.loginWithGoogle();
                    },
                  ),
                  SizedBox(width: Spacements.M),
                  SocialButton(
                    iconPath: AppAssets.appleIcon,
                    onTap: () {
                      //TODO: implementar login com Apple
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.dontHaveAnAccount,
                    style: TextStyle(
                      color: AppColors.neutralGrayMiddle,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: Spacements.XXS),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      Strings.signUp,
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
