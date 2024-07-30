import 'package:flutter/material.dart';
import 'package:qize_app/Ui/add_exam_page.dart';
import 'package:qize_app/Ui/admin_user.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/Ui/qize_app_screen.dart';
import 'package:qize_app/data/models/qizetion_model.dart';

class HomePage extends StatefulWidget {
  int? iden;
  HomePage({super.key, this.iden});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey,
            Colors.black,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                text: 'Quize Application',
                color: Colors.white,
                size: 20,
              ),
              textWidget(
                text: 'welcome, please choose a material:',
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  height: 1000,
                  width: double.infinity,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => itemBuild(index),
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget itemBuild(int index) {
    return GestureDetector(
      onTap: () {
        if (widget.iden == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddExamPage(
                      index: index,
                      nameImg: data1[index].imgName,
                      text: data1[index].text)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QizeAppScreen(index: index),
              ));
        }
      },
      child: Container(
        height: 180,
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'asset/images/${data1[index].imgName}.jpg',
                fit: BoxFit.cover,
                width: 160,
                height: 150,
              ),
            ),
            textWidget(
              text: '${data1[index].text}',
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
