import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends2/controller/write_page_controller.dart';

class WritePageView extends StatefulWidget {
  const WritePageView({Key? key}) : super(key: key);

  @override
  _WritePageViewState createState() => _WritePageViewState();
}

class _WritePageViewState extends State<WritePageView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final PostController postController = Get.find<PostController>();

  bool _isUrlEnabled = false;

  @override
  Widget build(BuildContext context) {
    final String category = Get.arguments as String;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              '글 쓰기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 212, 221, 232),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    postController.sendPost(
                      _titleController.text,
                      _contentController.text,
                      category,
                      _isUrlEnabled ? _urlController.text : '',
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ]),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: '제목',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 203, 208, 216),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 203, 208, 216),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요.',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 203, 208, 216),
                    fontSize: 12,
                  ),
                ),
                maxLines: 10,
              ),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 203, 208, 216),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('URL 있음'),
                      value: true,
                      groupValue: _isUrlEnabled,
                      onChanged: (bool? value) {
                        setState(() {
                          _isUrlEnabled = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('URL 없음'),
                      value: false,
                      groupValue: _isUrlEnabled,
                      onChanged: (bool? value) {
                        setState(() {
                          _isUrlEnabled = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              if (_isUrlEnabled)
                TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    hintText: 'URL을 입력하세요.',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 203, 208, 216),
                      fontSize: 12,
                    ),
                  ),
                ),
            ])));
  }
}
