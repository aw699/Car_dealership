import 'package:cardealership/controllers/home_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/views/theme/my_themes.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:cardealership/views/widgets/custom_button.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  Details({super.key});
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theCar = cars
        .where((element) => element.id == homeController.currentDetails)
        .toList();
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeManager.instance.getMode(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            "Car Details",
            style: bodyLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                verticalSpace(30),
                Image.asset(theCar[0].image),
                verticalSpace(50),
                buildCardTitle(theCar[0].title),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCardPrice(theCar[0].price.toString()),
                    buildCardPrice(theCar[0].rentPrice.toString()),
                  ],
                ),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CostomButton(
                      text: "Buy",
                      OnPressed: () {},
                    ),
                    CostomButton(
                      text: "Rent",
                      OnPressed: () {},
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
