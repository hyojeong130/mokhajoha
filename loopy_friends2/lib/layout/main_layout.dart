import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: child),
    );
  }
}
