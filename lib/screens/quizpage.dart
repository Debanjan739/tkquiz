import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:talkengpwi/screens/quiz_controller.dart';



class Qp extends StatelessWidget {
  final QuizController qc = Get.put(QuizController());
  //
  // late Timer _timer;
  // int questionIndex = 0;
  // String? selectedOption;
  // int minutes = 3;
  // int seconds = 0;
  //
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(oneSec, (timer) {
  //     if (minutes == 0 && seconds == 0) {
  //       timer.cancel();
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('Time is Over'),
  //             content: const Text('Submit your answers.'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('OK'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     } else {
  //       setState(() {
  //         if (seconds > 0) {
  //           seconds--;
  //         } else {
  //           minutes--;
  //           seconds = 59;
  //         }
  //       });
  //     }
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    final question = qc.questions[qc.questionIndex.value];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Time Left:dddd',
          // 'Time Left: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 430,
          height: 620,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.help_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            question.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Obx(()=>
                  OptionButton(
                  number: '     A .',
                  text: question.options[0],
                  onPressed: () {
                      qc.selectedOption.value = 'A';
                  },
                  isSelected: qc.selectedOption.value == 'A',
                ),
              ),
              Obx(()=>
              OptionButton(
                number: '     B .',
                text: question.options[1],
                onPressed: () {
                    qc.selectedOption.value = 'B';
                },
                isSelected: qc.selectedOption.value == 'B',
              ),),
              Obx(()=>
              OptionButton(
                number: '     C .',
                text: question.options[2],
                onPressed: () {
                  qc.selectedOption.value = 'C';
                },
                isSelected: qc.selectedOption.value == 'C',
              ),),
              Obx(()=>
              OptionButton(
                number: '     D .',
                text: question.options[3],
                onPressed: () {
                  qc.selectedOption.value = 'D';
                },
                isSelected: qc.selectedOption.value == 'D',
              ),),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(()=>
                    Text(
                      'Questions: ${qc.questionIndex + 1}/${qc.questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                    qc.questionIndex.value = (qc.questionIndex.value - 1) % qc.questions.length;
                    qc.selectedOption.value = '';
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (qc.questionIndex.value == qc.questions.length - 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Time is Over'),
                        content: const Text('Submit your answers.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  qc.questionIndex.value = (qc.questionIndex.value + 1) % qc.questions.length;
                    qc.selectedOption.value = '';
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 136, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Text(
                qc.questionIndex.value == qc.questions.length - 1 ? 'Submit' : 'Next',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class OptionButton extends StatelessWidget {
  final String number;
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final Color buttonColor;

  const OptionButton({super.key,
    required this.number,
    required this.text,
    required this.onPressed,
    required this.isSelected,
    this.buttonColor = Colors.white10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.1),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: isSelected ? Colors.deepPurpleAccent : buttonColor,
        ),
        child: Row(
          children: [
            Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class Question {
  final String text;
  final List<String> options;

  Question(this.text, this.options);
}
