import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/controllers/home_controller.dart';
import 'package:cardealership/models/car_model.dart';
import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/views/widgets/app_drawer.dart';
import 'package:cardealership/views/theme/my_themes.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:cardealership/views/widgets/custom_button.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

HomeController? homeController;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ThemeManager.instance.addListener(() {
      setThemeManager();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    ThemeManager.instance.removeListener(() {
      setThemeManager();
    });
  }

  setThemeManager() {
    if (mounted) {
      setState(() {});
    }
  }

  final homeController =
      Get.put<HomeController>(HomeController(), permanent: true);
  final favoriteController =
      Get.put<FavoriteController>(FavoriteController(), permanent: true);
  final cartController =
      Get.put<CartController>(CartController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeManager.instance.getMode(),
      home: Scaffold(
          appBar: AppBar(
            actions: [
              Switch(
                value: ThemeManager.instance.getMode() == ThemeMode.dark,
                onChanged: (isDark) {
                  ThemeManager.instance.toggleTheme(isDark);
                },
              ),
              IconButton(
                  onPressed: () {
                    Get.toNamed(CART);
                  },
                  icon: const Icon(FontAwesomeIcons.cartArrowDown))
            ],
            title: InkWell(
              child: Text(
                "Home",
                style: bodyLarge,
              ),
            ),
            centerTitle: true,
          ),
          drawer: getDrawer(),
          body: bulidUI()),
    );
  }

  bulidUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          buildSearchBar(),
          verticalSpace(15),
          Text("TOP Brands", style: bodyLarge),
          verticalSpace(10),
          bulidCarsModels(),
          verticalSpace(20),
          productListView()
        ],
      ),
    );
  }

  productListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: cars.length,
        separatorBuilder: (context, index) => verticalSpace(20),
        itemBuilder: (context, index) {
          var item = cars[index];
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      item.title,
                      style: bodySmall,
                    ),
                    GetBuilder<FavoriteController>(
                      builder: (controller) {
                        return IconButton(
                          onPressed: () {
                            favoriteController.addItem(item);
                          },
                          icon: Icon(
                            item.isFavoirte
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: const Color.fromARGB(255, 128, 24, 24),
                          ),
                        );
                      },
                    ),
                    GetBuilder<CartController>(
                      builder: (controller) {
                        return IconButton(
                            onPressed: () {
                              cartController.addItem(item);
                            },
                            icon: Icon(
                              Icons.add,
                              color: cartController.isOnTheCart(item)
                                  ? primaryDark
                                  : ThemeManager.instance.getMode() ==
                                          ThemeMode.dark
                                      ? whiteColor
                                      : Colors.black,
                            ));
                      },
                    )
                  ],
                ),
                verticalSpace(10),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      homeController.currentDetails = item.id;
                      Get.toNamed(DETAILES);
                    },
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.fill,
                      width: screenWidth,
                      height: 200,
                    ),
                  ),
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          buildCardPrice(item.price.toString()),
                          verticalSpace(5),
                          CostomButton(
                            text: "Buy",
                            OnPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        buildCardPrice(item.rentPrice.toString()),
                        CostomButton(
                          text: "Rent",
                          OnPressed: () {},
                        ),
                      ],
                    )),
                  ],
                ),
                verticalSpace(20),
              ],
            ),
          );
        },
      ),
    );
  }
}
