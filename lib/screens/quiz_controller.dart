import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class QuizController extends GetxController {
  RxInt minutes = 3.obs;
  RxInt seconds = 0.obs;
  RxInt questionIndex = 0.obs;
  RxString selectedOption = ''.obs;

  final List<Question> questions = [
    Question('Question 1', ['Option A', 'Option B', 'Option C', 'Option D'],1),
    Question('Question 2', ['Option A', 'Option B', 'Option C', 'Option D'],2),
    Question('Question 3', ['Option A', 'Option B', 'Option C', 'Option D'],3),
    // Add more questions here
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Stream<QuerySnapshot> questionsStream;


  @override
  void onInit() {
    super.onInit();
    // fetchQuestions();
    startTimer();
  }

  // void fetchQuestions() {
  //   questionsStream = firestore.collection('questions').snapshots();
  //   questionsStream.listen((snapshot) {
  //     questions = snapshot.docs.map((doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       return Question(
  //         data['text'],
  //         List<String>.from(data['options']),
  //       );
  //     }).toList();
  //     update(); // Notify GetX to update the UI
  //   });
  // }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (minutes.value == 0 && seconds.value == 0) {
        timer.cancel();
        // Show dialog or perform other actions when time is over
      } else {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          minutes.value--;
          seconds.value = 59;
        }
      }
    });
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void goToNextQuestion() {
    if (questionIndex.value == questions.length - 1) {
      // Handle reaching the last question
    } else {
      questionIndex.value = (questionIndex.value + 1) % questions.length;
      selectedOption.value = '';
    }
  }

  void goToPreviousQuestion() {
    questionIndex.value = (questionIndex.value - 1) % questions.length;
    selectedOption.value = '';
  }
}

class Question {
  final String text;
  final List<String> options;
  final int res;

  Question(this.text, this.options, this.res);
}
