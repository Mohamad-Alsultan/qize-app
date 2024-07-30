import 'package:flutter/material.dart';
import 'package:qize_app/Ui/add_exam_page.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/Ui/home_page.dart';
import 'package:qize_app/Ui/qize_app_screen.dart';
import 'package:qize_app/data/models/qizetion_model.dart';

class Admin_User extends StatefulWidget {
  Admin_User({
    super.key,
  });

  @override
  State<Admin_User> createState() => _Admin_UserState();
}

class _Admin_UserState extends State<Admin_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey,
            Colors.black,
          ],
        )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              textWidget(
                text: 'select Admin to add exam or user to do exam',
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                height: 150,
              ),
              defaultBotton(
                colors: Colors.green,
                text: 'Admin',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(iden: 0),
                      ));
                },
                size: 30,
                textcolor: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              defaultBotton(
                colors: Colors.red,
                textcolor: Colors.white,
                text: 'user',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(iden: 1),
                      ));
                },
                size: 30,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
