import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  final List<String> students = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
    'Student 11',
    'Student 12',
    'Student 13',
    'Student 14',
    'Student 15',
    'Student 16',
    'Student 17',
    'Student 18',
    'Student 19',
    'Student 20',
    // Add more students...
  ];

  final List<int> results = [
    90, 85, 95, 80, 88, 92, 87, 93, 89, 91, 84, 97, 82, 86, 94, 83, 96, 98, 81, 99,
    // Add more results...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/student1.png'),
                radius: 30.0,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/student2.png'),
                radius: 30.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/student3.png'),
                radius: 30.0,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView.separated(
                itemCount: students.length + 1, // Include heading as an item
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  );
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Heading item
                    return ListTile(
                      leading: Text(
                        'Rank',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          'Student',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: Text(
                        'Result',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  final student = students[index - 1];
                  final result = results[index - 1];

                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#$index',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          student,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          result.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LeaderboardPage(),
  ));
}
