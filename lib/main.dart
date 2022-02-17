import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:quizzler/scorekeeper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(
      const Quizzler(),
    );

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  ScoreBox scoreobj = ScoreBox();
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  void alertMessage() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.

                setState(
                  () {
                    bool quizstatus = quizBrain.isFinished();
                    if (quizstatus == true) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        style:
                            AlertStyle(animationType: AnimationType.fromBottom),
                        title: "Quiz",
                        desc: "You Have Reached the end of the quiz!",
                        buttons: [
                          DialogButton(
                            child: const Text(
                              "OKAY",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                      quizBrain.restartQuiz();
                      scoreKeeper.length = 0;
                    } else {
                      bool correctAnswer = quizBrain.getAnswerText();
                      if (correctAnswer == true) {
                        scoreobj.getchoice(correctAnswer);
                      } else {
                        scoreobj.getchoice(correctAnswer);
                      }
                      quizBrain.nextQuestion();
                    }
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(
                  () {
                    bool quizstatus = quizBrain.isFinished();
                    if (quizstatus == true) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        style:
                            AlertStyle(animationType: AnimationType.fromBottom),
                        title: "Quiz",
                        desc: "You Have Reached the end of the quiz!",
                        buttons: [
                          DialogButton(
                            child: const Text(
                              "OKAY",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                      quizBrain.restartQuiz();
                      scoreKeeper.length = 0;
                    } else {
                      bool correctAnswer = quizBrain.getAnswerText();
                      if (correctAnswer == false) {
                        scoreobj.getchoice(correctAnswer);
                      } else {
                        scoreobj.getchoice(correctAnswer);
                      }

                      quizBrain.nextQuestion();
                    }
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: scoreobj.scoreKeeper,
        )
      ],
    );
  }
}
