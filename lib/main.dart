import 'package:flutter/material.dart';
import 'package:qize_app/Ui/add_exam_page.dart';
import 'package:qize_app/Ui/admin_user.dart';
import 'package:qize_app/Ui/home_page.dart';
import 'package:qize_app/Ui/qize_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Admin_User(),
    );
  }
}
