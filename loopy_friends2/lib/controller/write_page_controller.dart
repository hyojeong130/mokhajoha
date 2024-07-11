import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loopy_friends2/constants/url.dart';
import 'dart:convert';

class PostController extends GetxController {
  Future<void> sendPost(String title, String content, String category) async {
    String url = '${Urls.apiUrl}notice/';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'content': content,
        'category': category,
      }),
    );

    if (response.statusCode == 200) {
      Get.back();
    } else {
      Get.snackbar('Error', 'Failed to add post');
    }
  }
}
