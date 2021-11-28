import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luanvanflutter/controller/controller.dart';
import 'package:luanvanflutter/models/ctuer.dart';
import 'package:luanvanflutter/models/user.dart';

import 'compatibility.dart';

class CompatibilityIntroPage extends StatefulWidget {
  final UserData ctuer;
  final UserData userData;
  final String gameRoomId;
  const CompatibilityIntroPage({Key? key, required this.ctuer, required this.userData, required this.gameRoomId}) : super(key: key);
  @override
  _CompatibilityIntroPageState createState() => _CompatibilityIntroPageState();
}

class _CompatibilityIntroPageState extends State<CompatibilityIntroPage> {
  List<String> questions = [];


  initalize() async {
    QuerySnapshot query = await DatabaseServices(uid: '').getDocCompQuestions(
        widget.gameRoomId);
    if (query.docs.isNotEmpty) {
      for (int i = 0; i < 5; i++) {
        questions.add(query.docs[0].get('questions')[i].toString());
      }
    }
    print(questions);
  }

  @override
  void initState() {
    initalize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trò chơi hỏi xoáy đáp xoay!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 300,
            child: Column(
              children: const <Widget>[
                AutoSizeText(
                  '5 câu hỏi trong 10 giây!',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 3),
                AutoSizeText(
                  'Câu hỏi sẽ được gởi đến bạn chat của bạn. Điểm sẽ được hiện lên.',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionGame(
                      gameRoomId: widget.gameRoomId,
                      questions: questions,
                      ctuer: widget.ctuer,
                      userData: widget.userData,
                    ),
                  ),
                );
              },
              child: const Text(
                'Bắt đầu',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
