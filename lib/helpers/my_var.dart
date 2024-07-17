//Colors

// ignore_for_file: constant_identifier_names

import 'package:cardealership/models/brands_model.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
//routName

const String SPLASH = "/splash";
const String HOME = "/home";
const String LOGIN = "/login";
const String REGISTER = "/register";
const String FAVORITE = "/favorite";
const String DETAILES = "/detailes";
const String SPARE_PARTS = "/spareParts";
const String CART = "/cart";

// my fonts
String primaryFontFamily = "Lumanosimo";

//styles
TextStyle bodyLarge =
    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
TextStyle bodyMedium =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle bodySmall =
    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

//colors
const Color whiteColor = Colors.white;
const Color redColor = Colors.red;
const Color primaryDark = Colors.deepPurple;
const Color aceentDark = Colors.deepPurpleAccent;
const Color primaryLight = Colors.deepOrange;
const Color aceentLight = Colors.deepOrangeAccent;
const Color backgroundDark = Color.fromARGB(255, 48, 48, 48);
Color cardColor = const Color.fromARGB(255, 0, 0, 0);
//Screen

double screenWidth = double.infinity;
double screenHeight = double.infinity;

// my Drawer

// searchBar
buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: whiteColor),
          border: InputBorder.none,
          fillColor: cardColor,
          filled: true),
    ),
  );
}

// Cars models
bulidCarsModels() {
  return Container(
    width: screenWidth,
    height: 100,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => horizontalSpace(10),
      itemCount: brands.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            //write here the on click logic
          },
          child: Image.asset(
            brands[index].image,
          ),
        );
      },
    ),
  );
}

//

buildCardTitle(String title) {
  return Text(
    title,
    style: bodyLarge,
  );
}

buildCardPrice(String price) {
  return Text("\$ $price", style: bodyMedium);
}
