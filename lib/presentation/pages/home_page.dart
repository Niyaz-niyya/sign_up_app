import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home")), 
        actions: [
          IconButton(onPressed: authController.logout, icon: const Icon(Icons.logout))
        ]
      ),
      body: Center(
        child: Obx(
          () => Text(
            "Welcome, ${authController.userProfile['username'] ?? 'User'}"
            )
          )
        ),
    );
  }
}
