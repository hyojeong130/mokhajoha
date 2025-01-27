import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends2/router/main_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PlacePlanPlatform',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      getPages: MainRouter.routes,
      initialBinding: BindingsBuilder(() {
        // Get.put(AuthService());
      }),
    );
  }
}
