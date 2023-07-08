import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkengpwi/screens/Leaderboard1.dart';
import 'package:talkengpwi/screens/enroll.dart';
import 'package:share/share.dart';


class BoxWithText extends StatelessWidget {
  final String text;
  final String imagePath;
  final String buttonLabel;
  final String questionCount;
  final String duration;
  final String date;
  final String time;
  final Function onPressed;

  const BoxWithText({super.key,
    required this.text,
    required this.imagePath,
    required this.buttonLabel,
    required this.questionCount,
    required this.duration,
    required this.date,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Share.share('Hello, check out this amazing quiz app!');
                    },
                  ),
                ],
              ),
              // const SizedBox(height: 17.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    questionCount,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.timer,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Get.dialog(
                          CustomDialog(
                            title: 'Details',
                            content: 'This is a dialog.',
                            onClosePressed: () {
                              Get.back(); // Close the dialog
                            },
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Enroll Now',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LeaderboardPage());
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LeaderboardPage()),
                        );*/
                        // Handle Leader Board button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Leader Board',

                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
