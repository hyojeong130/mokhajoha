import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends2/view/notice_list_page/notice_list_view.dart';
import 'package:loopy_friends2/controller/notice_list_controller.dart';
import 'package:loopy_friends2/controller/write_page_controller.dart';

class NoticePageView extends StatefulWidget {
  const NoticePageView({super.key});

  @override
  _NoticePageViewState createState() => _NoticePageViewState();
}

class _NoticePageViewState extends State<NoticePageView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final NoticeController noticeController = Get.put(NoticeController());
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 0;

    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (!_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          noticeController.refreshData('totalCouncil');
          break;
        case 1:
          noticeController.refreshData('departmentCouncil');
          break;
        case 2:
          noticeController.refreshData('departmentNotice');
          break;
        case 3:
          noticeController.refreshData('applyRecruit');
          break;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String getCategoryForCurrentTab() {
    switch (_tabController.index) {
      case 0:
        return 'totalCouncil';
      case 1:
        return 'departmentCouncil';
      case 2:
        return 'departmentNotice';
      case 3:
        return 'applyRecruit';
      default:
        return 'applyRecruit'; //예외 케이스 보려고 해둔거임
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TabBar(
          controller: _tabController,
          labelColor: const Color.fromARGB(255, 179, 197, 218),
          unselectedLabelColor: const Color.fromARGB(255, 70, 73, 77),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          indicator: const BoxDecoration(),
          indicatorColor: Colors.transparent,
          indicatorWeight: 0.0,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: '총학생회'),
            Tab(text: '과학생회'),
            Tab(text: '학과 공지'),
            Tab(text: '신청/모집'),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            NoticeListView(category: 'totalCouncil'),
            NoticeListView(category: 'departmentCouncil'),
            NoticeListView(category: 'departmentNotice'),
            NoticeListView(category: 'applyRecruit'),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final category = getCategoryForCurrentTab();
            Get.toNamed('/write', arguments: category);
          },
          icon: const Icon(Icons.create),
          label: const Text('글쓰기'),
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
