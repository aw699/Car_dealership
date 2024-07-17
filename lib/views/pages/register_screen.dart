import 'package:cardealership/controllers/auth_controller.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:flutter/material.dart';
import 'package:cardealership/views/pages/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/app_progress_button.dart';
import '../widgets/custom_text_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "CAR ZONE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      FontAwesomeIcons.hands,
                      color: Colors.yellow,
                    )
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: authController.registerFirstNameController,
                        hintText: "Firstname",
                        keyboardType: TextInputType.name,
                        fillColor: Colors.grey,
                        borderColor: Colors.white,
                        hintColor: Colors.white,
                        prefixIcon: Icons.person,
                        radius: 30,
                        prefixIconColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextFormField(
                        controller: authController.registerLastNameController,
                        hintText: "Lastname",
                        keyboardType: TextInputType.name,
                        fillColor: Colors.grey,
                        borderColor: Colors.white,
                        hintColor: Colors.white,
                        prefixIcon: Icons.person,
                        radius: 30,
                        prefixIconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: authController.registerEmailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  fillColor: Colors.grey,
                  borderColor: Colors.white,
                  hintColor: Colors.white,
                  prefixIcon: Icons.email,
                  radius: 30,
                  prefixIconColor: Colors.white,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: authController.registerPasswordController,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  fillColor: Colors.grey,
                  borderColor: Colors.white,
                  hintColor: Colors.white,
                  isPassword: true,
                  radius: 30,
                  suffixIconColor: Colors.white,
                  prefixIcon: Icons.password,
                  prefixIconColor: Colors.white,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: authController.registerConfirmPasswordController,
                  hintText: "Confirm password",
                  keyboardType: TextInputType.visiblePassword,
                  fillColor: Colors.grey,
                  borderColor: Colors.white,
                  hintColor: Colors.white,
                  isPassword: true,
                  radius: 30,
                  suffixIconColor: Colors.white,
                  prefixIcon: Icons.password,
                  prefixIconColor: Colors.white,
                ),
                const SizedBox(height: 30),
                Center(
                  child: AppProgressButton(
                    width: MediaQuery.of(context).size.width,
                    isBordered: true,
                    backgroundColor: Colors.grey,
                    height: 55,
                    text: "REGISTER",
                    fontSize: 18,
                    radius: 30,
                    onPressed: (animationController) async {
                      animationController.forward();
                      // Call the function to add account to Firebase
                      bool success = await authController.addAccountToFirebase();
                      if (success) {
                        // If registration is successful, navigate to the home screen
                        Navigator.pushReplacementNamed(context, HOME);
                      } else {
                        // Handle registration failure
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Registration failed"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      animationController.reverse();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(LOGIN);
                  },
                  child: const Center(
                    child: Text(
                      "Don't have an account? Login",
                      style: TextStyle(
                        color: Colors.white,
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
