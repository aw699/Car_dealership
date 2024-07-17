import 'package:cardealership/controllers/auth_controller.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/app_progress_button.dart';
import '../widgets/custom_text_form.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final AuthController authController =
  Get.put<AuthController>(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/pexels-kamshotthat-3457780.jpg",
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Row(
                  children: [
                    Text("CAR ZONE",
                        style: Theme.of(context).textTheme.bodyText1),
                    horizontalSpace(12),
                    const Icon(
                      FontAwesomeIcons.hand,
                      color: Colors.yellow,
                    )
                  ],
                ),
                verticalSpace(50),
                Text("LOGIN", style: Theme.of(context).textTheme.headline4),
                verticalSpace(50),
                CustomTextFormField(
                  controller: authController.loginEmailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  fillColor: Colors.grey,
                  borderColor: whiteColor,
                  hintColor: whiteColor,
                  prefixIcon: Icons.email,
                  radius: 30,
                  prefixIconColor: whiteColor,
                ),
                verticalSpace(30),
                CustomTextFormField(
                  controller: authController.loginPasswordController,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  fillColor: Colors.grey,
                  borderColor: whiteColor,
                  hintColor: whiteColor,
                  isPassword: true,
                  radius: 30,
                  suffixIconColor: whiteColor,
                  prefixIcon: Icons.password,
                  prefixIconColor: whiteColor,
                ),
                verticalSpace(30),
                Center(
                  child: AppProgressButton(
                    width: screenWidth,
                    isBordered: true,
                    backgroundColor: Colors.grey,
                    height: 55,
                    text: "LOGIN",
                    fontSize: 18,
                    radius: 30,
                    onPressed: (animationController) async {
                      animationController.forward();
                      String email =
                          authController.loginEmailController.text;
                      bool accountExists =
                      await authController.loginAcountIsExist(email);
                      if (accountExists) {
                        // if the user has the account
                        Future.delayed(
                          const Duration(seconds: 1),
                              () {
                            animationController.reverse();
                            Navigator.of(context)
                                .pushReplacementNamed(HOME); // Navigate to home screen
                          },
                        );
                      } else {
                        // if not, show error message
                        animationController.reverse();
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Account does not exist"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                ),
                verticalSpace(30),
                const Center(
                  child: Text(
                    "------ Or -------",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                      backGroundColor: whiteColor,
                      icon: FontAwesomeIcons.facebook,
                      iconColor: Colors.blue,
                    ),
                    SocialButton(
                      backGroundColor: whiteColor,
                      icon: FontAwesomeIcons.google,
                      iconColor: Colors.red,
                    ),
                    SocialButton(
                      backGroundColor: whiteColor,
                      icon: FontAwesomeIcons.twitter,
                      iconColor: Colors.blue,
                    ),
                    SocialButton(
                      backGroundColor: whiteColor,
                      icon: FontAwesomeIcons.tiktok,
                    )
                  ],
                ),
                verticalSpace(20),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(REGISTER);
                  },
                  child: const Center(
                    child: Text(
                      "Don't have an account? Signup",
                      style: TextStyle(
                        color: Color.fromARGB(255, 237, 6, 6),
                        fontSize: 16,
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
}
