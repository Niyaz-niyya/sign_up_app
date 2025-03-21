import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/bindings/auth_binding.dart';
import 'package:sign_up/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
