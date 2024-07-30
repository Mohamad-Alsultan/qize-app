import 'package:flutter/material.dart';

class QizeModle {
  String question;
  List<Map<String, dynamic>> choices = [];
  String answer;
  QizeModle(
      {required this.question, required this.choices, required this.answer});
}

List<QizeModle> data = [
  QizeModle(
      question: 'how are you:',
      choices: [
        {'identifier': 'A', 'answer': 'i am good'},
        {'identifier': 'B', 'answer': 'i am not good'},
        {'identifier': 'C', 'answer': 'i am verey hungry'},
      ],
      answer: 'A'),
  QizeModle(
      question: 'how old are you:',
      choices: [
        {'identifier': 'A', 'answer': 'i am 20'},
        {'identifier': 'B', 'answer': 'i am 21'},
        {'identifier': 'C', 'answer': 'i am 23'},
        {'identifier': 'D', 'answer': 'i am 25'},
      ],
      answer: 'C'),
  QizeModle(
      question: 'whrer are you from:',
      choices: [
        {'identifier': 'A', 'answer': 'i am from damascus'},
        {'identifier': 'B', 'answer': 'i am from der alzor'},
        {'identifier': 'C', 'answer': 'i am draa'},
        {'identifier': 'D', 'answer': 'i am tartous'},
      ],
      answer: 'A')
];

class MaterialModle {
  String imgName;
  String text;
  List<QizeModle> exam = [];
  MaterialModle(
      {required this.imgName, required this.text, required this.exam});
}

List<MaterialModle> data1 = [
  MaterialModle(
    imgName: 'english',
    text: 'English',
    exam: [
      QizeModle(
          question: 'how are you:',
          choices: [
            {'identifier': 'A', 'answer': 'i am good'},
            {'identifier': 'B', 'answer': 'i am not good'},
            {'identifier': 'C', 'answer': 'i am verey hungry'},
          ],
          answer: 'A'),
    ],
  ),
  MaterialModle(imgName: 'art', text: 'Art', exam: [
    QizeModle(
        question: 'how old are you:',
        choices: [
          {'identifier': 'A', 'answer': 'i am 20'},
          {'identifier': 'B', 'answer': 'i am 21'},
          {'identifier': 'C', 'answer': 'i am 23'},
          {'identifier': 'D', 'answer': 'i am 25'},
        ],
        answer: 'C'),
  ]),
  MaterialModle(imgName: 'math', text: 'Math', exam: [
    QizeModle(
        question: 'whrer are you from:',
        choices: [
          {'identifier': 'A', 'answer': 'i am from damascus'},
          {'identifier': 'B', 'answer': 'i am from der alzor'},
          {'identifier': 'C', 'answer': 'i am draa'},
          {'identifier': 'D', 'answer': 'i am tartous'},
        ],
        answer: 'A')
  ]),
  MaterialModle(imgName: 'physics', text: 'Physics', exam: [
    QizeModle(
        question: 'whrer are you from:',
        choices: [
          {'identifier': 'A', 'answer': 'i am from damascus'},
          {'identifier': 'B', 'answer': 'i am from der alzor'},
          {'identifier': 'C', 'answer': 'i am draa'},
          {'identifier': 'D', 'answer': 'i am tartous'},
        ],
        answer: 'A')
  ]),
  MaterialModle(imgName: 'program', text: 'Program', exam: [
    QizeModle(
        question: 'whrer are you from:',
        choices: [
          {'identifier': 'A', 'answer': 'i am from damascus'},
          {'identifier': 'B', 'answer': 'i am from der alzor'},
          {'identifier': 'C', 'answer': 'i am draa'},
          {'identifier': 'D', 'answer': 'i am tartous'},
        ],
        answer: 'A')
  ]),
];
