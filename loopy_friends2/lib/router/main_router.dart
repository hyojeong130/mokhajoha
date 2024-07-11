import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends2/view/notice_page/notice_page_view.dart';
import 'package:loopy_friends2/layout/main_layout.dart';
import 'package:loopy_friends2/view/write_page/write_page_view.dart';

class MainRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const MainLayout(
        child: NoticePageView(),
      ),
    ),
    GetPage(
      name: '/write',
      page: () => MainLayout(
        child: WritePageView(),
      ),
    ),
  ];
}
