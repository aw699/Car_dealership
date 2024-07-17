import 'package:cardealership/controllers/cart_controller.dart';

import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/models/spare_part_model.dart';
import 'package:cardealership/views/widgets/app_drawer.dart';
import 'package:cardealership/views/theme/my_themes.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:cardealership/views/widgets/custom_button.dart';

import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SpareParts extends StatelessWidget {
  SpareParts({super.key});

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeManager.instance.getMode(),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Spare Parts",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(CART);
                  },
                  icon: const Icon(FontAwesomeIcons.cartArrowDown))
            ],
          ),
          drawer: getDrawer(),
          body: Padding(
              padding: const EdgeInsets.all(0),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(20),
                      buildSearchBar(),
                      verticalSpace(20),
                      Expanded(
                        child: ListView.separated(
                          itemCount: sparePartsItems.length,
                          separatorBuilder: (context, index) =>
                              verticalSpace(20),
                          itemBuilder: (context, index) {
                            Item item = sparePartsItems[index];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildCardTitle(item.title),
                                      GetBuilder<CartController>(
                                        builder: (controller) {
                                          return IconButton(
                                              onPressed: () {
                                                cartController.addItem(item);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: cartController
                                                        .isOnTheCart(item)
                                                    ? primaryDark
                                                    : ThemeManager.instance
                                                                .getMode() ==
                                                            ThemeMode.dark
                                                        ? whiteColor
                                                        : Colors.black,
                                              ));
                                        },
                                      )
                                    ],
                                  ),
                                  verticalSpace(20),
                                  Container(
                                    width: 270,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                      child: Image.asset(
                                        sparePartsItems[index].image,
                                        fit: BoxFit.fill,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  verticalSpace(10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            buildCardPrice(
                                                item.price.toString()),
                                            verticalSpace(5),
                                            CostomButton(
                                              text: "Buy",
                                              OnPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )))),
    );
  }
}
