import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled22/QuizApp/Homepage.dart';
import 'package:untitled22/QuizApp/Questions.dart';

import 'Splashscreen.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController controller;
  int questionNumber = 1;
  int score = 0;
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text('Questions $questionNumber/${questions.length}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20),),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                final question = questions[index];
                return buildQuestion(question);
              },
              itemCount: questions.length,
              controller: controller,
            ),
          ),
          isLocked ? buildElevatedButton() : const SizedBox.shrink(),
          SizedBox(height: 200),
        ],
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          question.text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(height: 32),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                isLocked = question.isLocked;
                if (question.selectedOption!.isCorrect) {
                  score++;
                }
              }
            },
          ),
        ),
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (questionNumber < questions.length) {
          controller.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            questionNumber++;
            isLocked = false;
          });
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(score: score)),
          );
        }
      },style: ElevatedButton.styleFrom(primary: Colors.purple),
      child: Text(
        questionNumber < questions.length ? 'Next Page' : 'See The Result',style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question,);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.text,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              getIconForOption(option, question),
              color: color,
            ),
          ],
        ),
      ),
    );
  }


  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  IconData getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Icons.check : Icons.close;
      } else if (option.isCorrect) {
        return Icons.check;
      }
    }
    return Icons.radio_button_unchecked;
  }
}

class ResultPage extends StatelessWidget {
  final int score;

  const ResultPage({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'You Got $score/${questions.length}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                    (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.purple),
            child: Text(
              'Restart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
