import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../category/category_screen.dart';
import '../../widgets/video_player.dart';
import '../../widgets/youtube_player.dart';
import '../../models/training/training_guide.dart';

class GuideScreen extends StatefulWidget {
  final String category;
  final TrainingGuideList trainingGuideList;
  final int index;
  final double deviceHeight_half;

  GuideScreen({
    required this.category,
    required this.trainingGuideList,
    required this.index,
    required this.deviceHeight_half,
  });

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColor.whiteColor,
        foregroundColor: AppColor.blackColor,
        toolbarHeight: MediaQuery.of(context).viewPadding.top,
        elevation: 0,
        title: Text(
          'Training Guide - ${widget.category}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: widget.deviceHeight_half * 0.1),
              child: YoutubePlayerWidget(
                  videoId:
                      widget.trainingGuideList.guides[widget.index].videoId),
            ),
            Text(
              widget.trainingGuideList.guides[widget.index].trainingGuideText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              ),
            ),
            SizedBox(height: widget.deviceHeight_half * 0.13),
            Column(
              children: [
                // ElevatedButton .map 으로 변환 (이후 데이터를 기반으로 바뀌게)
                // 그럼 SizedBox는? 차라리 Container로 둘러싸고 padding을 넣거나 
                // margin을 넣어야 하나?
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
                  onPressed: () {
                    // onPressed에 들어가 있는 함수 반복됨. 따로 빼야함
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: widget.index <
                                  widget.trainingGuideList.count - 1
                              ? (context) => GuideScreen(
                                    category: widget.category,
                                    trainingGuideList: widget.trainingGuideList,
                                    index: widget.index + 1,
                                    deviceHeight_half: widget.deviceHeight_half,
                                  )
                              : (context) => CategoryScreen()),
                    );
                  },
                  child: Text(
                    widget.trainingGuideList.guides[widget.index].options[0],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.deviceHeight_half * 0.05,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: widget.index <
                                  widget.trainingGuideList.count - 1
                              ? (context) => GuideScreen(
                                    category: widget.category,
                                    trainingGuideList: widget.trainingGuideList,
                                    index: widget.index + 1,
                                    deviceHeight_half: widget.deviceHeight_half,
                                  )
                              : (context) => CategoryScreen()),
                    );
                  },
                  child: Text(
                    widget.trainingGuideList.guides[widget.index].options[1],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.deviceHeight_half * 0.05,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.whiteColor),
                    foregroundColor:
                        MaterialStateProperty.all(AppColor.blackColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: widget.index <
                                  widget.trainingGuideList.count - 1
                              ? (context) => GuideScreen(
                                    category: widget.category,
                                    trainingGuideList: widget.trainingGuideList,
                                    index: widget.index + 1,
                                    deviceHeight_half: widget.deviceHeight_half,
                                  )
                              : (context) => CategoryScreen()),
                    );
                  },
                  child: Text(
                    widget.trainingGuideList.guides[widget.index].options[2],
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
