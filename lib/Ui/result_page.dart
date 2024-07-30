import 'package:flutter/material.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/Ui/home_page.dart';
import 'package:qize_app/Ui/qize_app_screen.dart';
import 'package:qize_app/Ui/report.dart';
import 'package:qize_app/data/models/qizetion_model.dart';

class ResultPage extends StatefulWidget {
  double correctAnswer;
  List<MaterialModle> qusition;
  List<String> theAnswers;
  int index;
  ResultPage(
      {super.key,
      required this.correctAnswer,
      required this.index,
      required this.qusition,
      required this.theAnswers});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double get getAverage {
    return widget.correctAnswer / data1[widget.index].exam.length * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 116, 116),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QizeAppScreen(index: widget.index),
                  ));
            },
            icon: Icon(Icons.replay_sharp)),
        title: Text(
          'Result Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  child: Image.asset(
                    getAverage >= 60
                        ? 'asset/images/Exam Success.jpg'
                        : 'asset/images/fexams.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Column(
                children: [
                  Text(
                    'the Result:',
                  ),
                  Text(
                    '${getAverage}',
                    style: TextStyle(
                      color: getAverage >= 60 ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  defaultBotton(
                    textcolor: Colors.white,
                    colors: getAverage >= 60 ? Colors.green : Colors.red,
                    text: 'Home Page',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultBotton(
                    colors: Colors.red,
                    textcolor: Colors.white,
                    text: 'Show Report',
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ReprotPage(
                            quistion: widget.qusition,
                            index: widget.index,
                            theAnswers: widget.theAnswers,
                          );
                        },
                      ));
                    },
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
