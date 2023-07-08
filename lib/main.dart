import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cardView.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'White Boxes',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Choose Quiz'),
          // backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            BoxWithText(
              text: 'Quiz For Beginner',
              imagePath: 'assets/img1.png',
              buttonLabel: 'Enroll Now',
              questionCount: '30 Questions',
              duration: '30 minutes',
              date: '15/11/2023',
              time: '05:00 PM',
              onPressed: () {
                // Handle button press for Box 1
              },
            ),
            BoxWithText(
              text: 'Quiz For Intermediate',
              imagePath: 'assets/img1.png',
              buttonLabel: 'Enroll Now',
              questionCount: '30 Questions',
              duration: '30 minutes',
              date: '15/11/2023',
              time: '05:00 PM',
              onPressed: () {
                // Handle button press for Box 2
              },
            ),
            BoxWithText(
              text: 'Quiz For Advanced',
              imagePath: 'assets/img1.png',
              buttonLabel: 'Enroll Now',
              questionCount: '30 Questions',
              duration: '30 minutes',
              date: '15/11/2023',
              time: '05:00 PM',
              onPressed: () {
                // Handle button press for Box 3
              },
            ),
            BoxWithText(
              text: 'Quiz For Advanced',
              imagePath: 'assets/img1.png',
              buttonLabel: 'Enroll Now',
              questionCount: '30 Questions',
              duration: '30 minutes',
              date: '15/11/2023',
              time: '05:00 PM',
              onPressed: () {
                // Handle button press for Box 4
              },
            ),
            BoxWithText(
              text: 'Quiz For Advanced',
              imagePath: 'assets/img1.png',
              buttonLabel: 'Enroll Now',
              questionCount: '30 Questions',
              duration: '30 minutes',
              date: '15/11/2023',
              time: '05:00 PM',
              onPressed: () {
                // Handle button press for Box 5
              },
            ),
            // Add more BoxWithText widgets with different text, image paths, button labels, and callbacks
          ],
        ),
      ),
    );
  }
}
