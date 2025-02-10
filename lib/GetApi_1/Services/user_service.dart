import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/user_modal.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  UserService._internal();
  factory UserService() {
    return _instance;
  }
// Is this good aproach to use singlton patteren ??
  List<UserModal> postList = [];
  Future<List<UserModal>> getPostApi() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> iu in data) {
        postList.add(UserModal.fromJson(iu));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
