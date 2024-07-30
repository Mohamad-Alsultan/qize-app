import 'package:flutter/material.dart';
import 'package:qize_app/Ui/component/Widget.dart';
import 'package:qize_app/Ui/home_page.dart';
import 'package:qize_app/Ui/qize_app_screen.dart';
import 'package:qize_app/data/models/qizetion_model.dart';

class AddExamPage extends StatefulWidget {
  int index;
  String nameImg;
  String text;
  AddExamPage(
      {super.key,
      required this.index,
      required this.nameImg,
      required this.text});

  @override
  State<AddExamPage> createState() => _AddExamPageState();
}

class _AddExamPageState extends State<AddExamPage> {
  String? corrAnswer;
  TextEditingController questionName = TextEditingController();
  List<TextEditingController> chooie = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  GlobalKey<FormState> form_key = GlobalKey();
  int? selectAnswer;
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
          child: Form(
            key: form_key,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                        text: 'Please enter all information',
                        color: Colors.white,
                        size: 25),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: questionName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this field is reqiuerd';
                          }
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelText: 'enter your question',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 380,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is reqiuerd';
                              }
                            },
                            controller: chooie[index],
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: 'chooice ${index + 1}',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.black,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectAnswer = index;
                                      index == 0
                                          ? corrAnswer = 'A'
                                          : index == 1
                                              ? corrAnswer = 'B'
                                              : index == 2
                                                  ? corrAnswer = 'C'
                                                  : corrAnswer = 'D';
                                    });
                                  },
                                  icon: Icon(selectAnswer == index
                                      ? Icons.circle
                                      : Icons.circle_outlined)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: defaultBotton(
                          width: 200,
                          text: 'Save',
                          function: () {
                            if (form_key.currentState!.validate()) {
                              setState(() {
                                data1[widget.index].exam.add(
                                      QizeModle(
                                          question: questionName.text,
                                          choices: [
                                            {
                                              'identifier': 'A',
                                              'answer': '${chooie[0].text}'
                                            },
                                            {
                                              'identifier': 'B',
                                              'answer': '${chooie[1].text}'
                                            },
                                            {
                                              'identifier': 'C',
                                              'answer': '${chooie[2].text}'
                                            },
                                            {
                                              'identifier': 'D',
                                              'answer': '${chooie[3].text}'
                                            },
                                          ],
                                          answer: '$corrAnswer'),
                                    );
                                print(data1[widget.index].exam);
                              });
                            }
                          },
                          colors: Colors.green,
                          textcolor: Colors.white),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        defaultBotton(
                          width: 150,
                          text: 'Go Home Page',
                          colors: Colors.blue,
                          textcolor: Colors.white,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                        ),
                        defaultBotton(
                          width: 150,
                          text: 'Go To The Exam',
                          colors: Colors.red,
                          textcolor: Colors.white,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QizeAppScreen(index: widget.index),
                                ));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
