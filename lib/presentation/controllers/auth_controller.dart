import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domin/repositories/api_service.dart';
import '../../domin/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = AuthRepository(ApiService());

  var isLoading = false.obs;
  var token = "".obs;
  var userProfile = {}.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    var response = await authRepository.login(email, password);
    isLoading.value = false;

    if (response != null && response["token"] != null) {
      token.value = response["token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token.value);
      var profile = await authRepository.fetchUserProfile(token.value);
      if (profile != null) {
        userProfile.value = profile;
        Get.offAllNamed("/home");
      }
    } else {
      Get.snackbar("Error", "Invalid credentials", snackPosition: SnackPosition.BOTTOM,);
    }
  }

  Future<void> signup(String username, String email, String password) async {
    isLoading.value = true;
    bool success = await authRepository.signup(username, email, password);
    isLoading.value = false;

    if (success) {
      Get.snackbar(
        "Success", 
        "Account created. Please login.",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.toNamed("/login");
    } else {
      Get.snackbar("Error", "Username or Email already exists", snackPosition: SnackPosition.BOTTOM,);
    }
  }

  Future<void> fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString("token") ?? "";

    if (token.isNotEmpty) {
      var profile = await authRepository.fetchUserProfile(token.value);
      if (profile != null) {
        userProfile.value = profile;
      }
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token.value = "";
    Get.offAllNamed("/login");
  }
}
