import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/models/item.dart';
import 'package:cardealership/views/widgets/app_drawer.dart';
import 'package:cardealership/views/theme/my_themes.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Favorite extends StatelessWidget {
  Favorite({super.key});
  final favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    print(favoriteController.favoriteItems);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeManager.instance.getMode(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorite",
            style: bodyLarge,
          ),
          centerTitle: true,
        ),
        drawer: getDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(20),
              itemBuilder: (context, index) {
                Item item = favoriteController.favoriteItems[index];
                return Dismissible(
                  onDismissed: (direction) {
                    favoriteController.removeItem(item);
                  },
                  key: Key(index.toString()),
                  child: Container(
                    color: cardColor,
                    height: 320,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 15,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                        verticalSpace(10),
                        Image.asset(
                          item.image,
                          fit: BoxFit.fill,
                          width: screenWidth,
                          height: 200,
                        ),
                        verticalSpace(10),
                        buildCardTitle(item.title)
                      ],
                    ),
                  ),
                );
              },
              itemCount: favoriteController.itemsCount()),
        ),
      ),
    );
  }
}
