import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/views/pages/cart.dart';
import 'package:cardealership/views/pages/details.dart';
import 'package:cardealership/views/pages/favorite.dart';
import 'package:cardealership/views/pages/home_screen.dart';
import 'package:cardealership/views/pages/login_screen.dart';
import 'package:cardealership/views/pages/register_screen.dart';
import 'package:cardealership/views/pages/spare_parts.dart';
import 'package:cardealership/views/theme/my_themes.dart';
import 'package:cardealership/views/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  void initState()
  {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeManager.instance.getMode(),
      initialRoute: SPLASH,
      getPages: [
        GetPage(name: SPLASH, page: () => const SplashScreen()),
        GetPage(name: LOGIN, page: () => LoginScreen()),
        GetPage(
          name: REGISTER,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: HOME,
          page: () => const HomeScreen(),
        ),
        GetPage(name: FAVORITE, page: () => Favorite()),
        GetPage(
          name: SPARE_PARTS,
          page: () => SpareParts(),
        ),
        GetPage(name: DETAILES, page: () => Details()),
        GetPage(name: CART, page: () => CartScreen())
      ],
    );
  }
}
