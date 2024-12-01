import 'package:get/get.dart';

class UserController extends GetxController {
  var userImage = ''.obs;

  void setUserImage(String image) {
    userImage.value = image;
  }
}

final userController = UserController(); // Initialize the controller