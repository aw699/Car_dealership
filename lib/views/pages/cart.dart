import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:cardealership/views/widgets/custom_button.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../helpers/my_var.dart';
import '../theme/my_themes.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
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
            "Cart",
            style: bodyLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .60,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        Item item = cartController.cartItems[index];
                        return Dismissible(
                          onDismissed: (direction) {
                            cartController.removeItem(item);
                          },
                          key: Key(index.toString()),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            color: cardColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 120,
                                  child: Image.asset(item.image),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      item.title,
                                      style: bodySmall,
                                    ),
                                    verticalSpace(10),
                                    Text(
                                      item.price.toString(),
                                      style: bodyMedium,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(FontAwesomeIcons.plus)),
                                    GetBuilder<CartController>(
                                        builder: (controller) {
                                      return const Text("1");
                                    }),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(FontAwesomeIcons.minus))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(10),
                      itemCount: cartController.itemCount()),
                ),
                const Expanded(child: Divider()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w100),
                    ),
                    GetBuilder<CartController>(builder: (controller) {
                      return Text("${cartController.getTotalPrice()} \$");
                    })
                  ],
                ),
                verticalSpace(20),
                CostomButton(
                  OnPressed: () {},
                  text: "Check Out",
                  width: 250,
                  height: 50,
                ),
                verticalSpace(40)
              ],
            )),
      ),
    );
  }
}
