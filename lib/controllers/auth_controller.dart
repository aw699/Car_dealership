import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  //login Screen text editing Controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  //Register screen text editing controllers
  final TextEditingController registerFirstNameController =
  TextEditingController();
  final TextEditingController registerLastNameController =
  TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
  TextEditingController();
  final TextEditingController registerConfirmPasswordController =
  TextEditingController();

  String loginEmailText() {
    return loginEmailController.text;
  }

  String loginPasswordText() {
    return loginPasswordController.text;
  }

  String registerFirstNameText() {
    return registerFirstNameController.text;
  }

  String registerLastNameText() {
    return registerLastNameController.text;
  }

  String registerEmailText() {
    return registerEmailController.text;
  }

  String registerPasswordTextText() {
    return registerPasswordController.text;
  }

  String registerConfurmText() {
    return registerConfirmPasswordController.text;
  }

  // Function to check if login account exists
  Future<bool> loginAcountIsExist(String email) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: loginPasswordText(), // Use the password from the login controller
      );
      // Account exists, sign out the user
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      // Account doesn't exist or other error occurred
      return false;
    }
  }

  // Function to add account to Firebase
  Future<bool> addAccountToFirebase() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerEmailText(),
        password: registerPasswordTextText(),
      );
      // Account created successfully
      return true;
    } catch (e) {
      // Handle account creation failure
      print("Error creating account: $e");
      return false;
    }
  }

}

