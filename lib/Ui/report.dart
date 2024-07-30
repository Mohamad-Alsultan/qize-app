import 'package:flutter/material.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/Ui/home_page.dart';
import 'package:qize_app/data/models/qizetion_model.dart';

class ReprotPage extends StatelessWidget {
  List<MaterialModle> quistion;
  int index;
  List<String> theAnswers;
  ReprotPage(
      {super.key,
      required this.quistion,
      required this.index,
      required this.theAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          ...List.generate(
              quistion[index].exam.length,
              (i) => Card(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.grey,
                                  Colors.black,
                                ],
                              )),
                          child: Center(
                            child: textWidget(
                              color: Colors.white,
                              text: 'qusition 1',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textWidget(
                            text:
                                'the correct answer: ${quistion[index].exam[i].answer}'),
                        textWidget(text: 'your answer: ${theAnswers[i]}'),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
          SizedBox(
            height: 5,
          ),
          defaultBotton(
            textcolor: Colors.white,
            colors: Colors.green,
            text: "Go Home Page",
            function: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
          )
        ],
      ),
    );
  }
}
