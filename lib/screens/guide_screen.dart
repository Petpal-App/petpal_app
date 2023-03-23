import 'package:flutter/material.dart';

import '../screens/category_screen.dart';
import '../widgets/video_player.dart';
import '../widgets/youtube_player.dart';
import '../models/training_guide.dart';

class GuideScreen extends StatelessWidget {
  final String category;
  final TrainingGuideList trainingGuideList;
  final int index;

  GuideScreen(
      {required this.category,
      required this.trainingGuideList,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Guide - $category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayerWidget(
                videoId: trainingGuideList.guides[index].videoId),
            SizedBox(height: 20),
            Text(
              trainingGuideList.guides[index].trainingGuideText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: index < trainingGuideList.count - 1
                          ? (context) => GuideScreen(
                              category: category,
                              trainingGuideList: trainingGuideList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
                );
              },
              child: Text(trainingGuideList.guides[index].options[0]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: index < trainingGuideList.count - 1
                          ? (context) => GuideScreen(
                              category: category,
                              trainingGuideList: trainingGuideList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
                );
              },
              child: Text(trainingGuideList.guides[index].options[1]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: index < trainingGuideList.count - 1
                          ? (context) => GuideScreen(
                              category: category,
                              trainingGuideList: trainingGuideList,
                              index: index + 1)
                          : (context) => CategoryScreen()),
                );
              },
              child: Text(trainingGuideList.guides[index].options[2]),
            ),
          ],
        ),
      ),
    );
  }
}
