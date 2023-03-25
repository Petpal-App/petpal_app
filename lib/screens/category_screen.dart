import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../widgets/navbar.dart';
import '../widgets/mainpage_text_widget.dart';
import '../widgets/mainpage_training_listview.dart';
import '../widgets/mainpage_bodylanguage_listview.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height - 56;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.whiteColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColor.whiteColor,
        toolbarHeight: MediaQuery.of(context).viewPadding.top,
        elevation: 0,
        title: Text(
          "Petpal",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        // toolbarHeight: ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                width: deviceWidth,
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: AppColor.greenTambourine,
                      size: 50,
                    ),
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: deviceWidth,
                height: 120,
                padding: EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 15,
                ),
                child: MainPageDescriptionText(deviceWidth),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: (deviceHeight / 3.3),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: deviceWidth,
                          padding: const EdgeInsets.only(left: 14.0),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Body Language',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: deviceWidth,
                          padding: const EdgeInsets.only(left: 14.0),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Speak your pets language!',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: (((deviceHeight / 2.5) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2),
                          padding: const EdgeInsets.only(left: 8.0),
                          child: BodyLanguageListView(
                            deviceHeight: deviceHeight,
                            deviceWidth: deviceWidth,
                            cardName1: 'Dog',
                            cardName2: 'Cat',
                            cardName3: 'Bird',
                            cardName4: 'Fish',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: (deviceHeight / 3.3),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: deviceWidth,
                          padding: const EdgeInsets.only(left: 14.0),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Training Guide',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: deviceWidth,
                          padding: const EdgeInsets.only(left: 14.0),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Train your pet!',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: (((deviceHeight / 2.5) -
                                  12 -
                                  (10 * 2) -
                                  45 -
                                  4 -
                                  4) /
                              2),
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TrainingListView(
                            deviceHeight: deviceHeight,
                            deviceWidth: deviceWidth,
                            cardName1: 'Dog',
                            cardName2: 'Cat',
                            cardName3: 'Bird',
                            cardName4: 'Fish',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 0,
      ),
    );
  }
}
