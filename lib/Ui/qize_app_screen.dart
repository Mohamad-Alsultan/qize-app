import 'package:flutter/material.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/data/models/qizetion_model.dart';
import 'package:qize_app/Ui/result_page.dart';

class QizeAppScreen extends StatefulWidget {
  int index;
  QizeAppScreen({super.key, required this.index});

  @override
  State<QizeAppScreen> createState() => _QizeAppScreenState();
}

class _QizeAppScreenState extends State<QizeAppScreen> {
  int? quiestionLength;
  List<String> theAnswer = [];
  int quiestionNumber = 0;
  int? selectAnswer;
  String? selcAns;
  int correctAns = 0;
  @override
  void initState() {
    // TODO: implement initState
    quiestionLength = data1[widget.index].exam.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ListTile(
                title: textWidget(
                    text: '${data1[widget.index].text}',
                    size: 25,
                    boldText: true),
                subtitle: textWidget(
                    text:
                        'you have ${quiestionLength! - quiestionNumber} question '),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 450,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                        text:
                            '${data1[widget.index].exam[quiestionNumber].question}',
                        size: 20,
                        color: Colors.white),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 235,
                      // padding: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectAnswer = index;
                                  selcAns = data1[widget.index]
                                      .exam[quiestionNumber]
                                      .choices[index]['identifier'];
                                  theAnswer.add(selcAns!);
                                });
                              },
                              child: Card(
                                color: selectAnswer == index
                                    ? Colors.blue
                                    : Colors.white,
                                margin: EdgeInsets.all(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget(
                                          text:
                                              '${data1[widget.index].exam[quiestionNumber].choices[index]['identifier']}'),
                                      textWidget(
                                          text:
                                              '${data1[widget.index].exam[quiestionNumber].choices[index]['answer']}'),
                                      Icon(selectAnswer == index
                                          ? Icons.circle
                                          : Icons.circle_outlined)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: data1[widget.index]
                              .exam[quiestionNumber]
                              .choices
                              .length),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    defaultBotton(
                      colors: Colors.white,
                      text: quiestionNumber != quiestionLength! - 1
                          ? 'Answer'
                          : 'show result',
                      size: 20,
                      function: () {
                        if (selectAnswer == null) {
                          return;
                        }
                        if (selectAnswer != null &&
                            selcAns ==
                                data1[widget.index]
                                    .exam[quiestionNumber]
                                    .answer) {
                          setState(() {
                            correctAns++;
                            selectAnswer = null;
                          });
                        }
                        if (quiestionNumber < quiestionLength! - 1 &&
                            selectAnswer != null) {
                          setState(() {
                            quiestionNumber++;
                          });
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultPage(
                              index: widget.index,
                              correctAnswer: correctAns * 1.0,
                              qusition: data1,
                              theAnswers: theAnswer,
                            );
                          }));
                        }
                      },
                    ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     if (selectAnswer == null) {
                    //       return;
                    //     }
                    //     if (selectAnswer != null &&
                    //         selcAns ==
                    //             data1[widget.index]
                    //                 .exam[quiestionNumber]
                    //                 .answer) {
                    //       setState(() {
                    //         correctAns++;
                    //         selectAnswer = null;
                    //       });
                    //     }
                    //     if (quiestionNumber < quiestionLength! - 1 &&
                    //         selectAnswer != null) {
                    //       setState(() {
                    //         quiestionNumber++;
                    //       });
                    //     } else {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) {
                    //         return ResultPage(
                    //           index: widget.index,
                    //           correctAnswer: correctAns * 1.0,
                    //         );
                    //       }));
                    //     }
                    //   },
                    //   color: Colors.white,
                    //   child: textWidget(
                    //       text: quiestionNumber != quiestionLength! - 1
                    //           ? 'Answer'
                    //           : 'show result',
                    //       size: 20),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
