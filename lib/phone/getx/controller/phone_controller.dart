import 'package:get/get.dart';

class PhoneVerificationController extends GetxController {
  var code = ''.obs;

  void setCode(String pin) {
    code.value = pin;
  }

  void goBack() {
    Get.back();
  }

  void verifyPhoneNumber() async {
    try {

    } catch (e) {
      print("Wrong OTP");
    }
  }

  void editPhoneNumber() {

  }
}
