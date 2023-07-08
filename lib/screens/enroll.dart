import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkengpwi/screens/quizpage.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onClosePressed;

  CustomDialog({
    required this.title,
    required this.content,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    final DialogController controller = Get.put(DialogController());

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
            child: Image.asset(
              'assets/en1.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Quiz Rules\n1. Total Questions: 30\n2. Duration: 30 minutes\n3. Scoring: +4 for correct answers, -1 for incorrect answers',
                  style: TextStyle(fontSize: 14),
                ),
                const Text(
                  'Guidelines\n4. Read questions carefully.\n5. Answer all questions within the time limit.\n6. Avoid guessing if unsure.\n7. Submit answers before time runs out.',
                  style: TextStyle(fontSize: 14),
                ),
                const Text(
                  'Note\n8. Final score based on correct answers and deductions.\n9. Highest score wins. Good luck!\n10. Cheating or using unauthorized resources is strictly prohibited.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 54),
                Obx(() => Row(
                  children: [
                    Checkbox(
                      value: controller.agreedToGuidelines.value,
                      onChanged: (value) {
                        controller.setAgreedToGuidelines(value ?? false);
                      },
                    ),
                    const Text(
                      'I accept all the\nterms and conditions',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )),
                SizedBox(height: 0),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.isAgreedToGuidelines
                            ? () {
                          Get.to(() => Qp());
                        }
                            : null,
                        child: const Text(
                          'Proceed',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onClosePressed,
                        child: const Text('Dismiss'),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DialogController extends GetxController {
  final RxBool agreedToGuidelines = false.obs;

  void setAgreedToGuidelines(bool value) {
    agreedToGuidelines.value = value;
  }

  bool get isAgreedToGuidelines => agreedToGuidelines.value;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCustomDialog(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CustomDialog(
          title: 'Dialog Title',
          content: 'Dialog Content',
          onClosePressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
