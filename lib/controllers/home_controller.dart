import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentDetails = -1;
  @override
  void onClose() {
    print("Home Controller is closed");
    super.onClose();
  }

  // ignore: non_constant_identifier_names
}
