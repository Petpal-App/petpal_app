import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String category;

  QuizScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - $category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Select what it thinks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Option 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Option 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Option 3'),
            ),
          ],
        ),
      ),
    );
  }
}
