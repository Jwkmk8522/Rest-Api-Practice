import 'package:api_practice/Example%205/example_5.dart';

import 'package:flutter/material.dart';

// import '../Example%205/example_5.dart';
// import '../GetApi_3/Screens/user3_screen.dart';
// import '../GetApi_2/Screens/second_example.dart';
// import '../GetApi_1/Screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Example5());
  }
}
