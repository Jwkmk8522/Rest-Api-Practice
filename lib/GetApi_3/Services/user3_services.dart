import 'dart:convert';

import 'package:api_practice/GetApi_3/Models/user3.dart';
import 'package:http/http.dart' as http;

class User3Services {
  static final User3Services _instance = User3Services._internal();
  factory User3Services() {
    return _instance;
  }
  User3Services._internal();

  List<User3> userList = [];
  Future<List<User3>> getApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print(response.body);
    final data = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      userList.clear();
      for (Map<String, dynamic> i in data) {
        userList.add(User3.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}
