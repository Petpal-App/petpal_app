import 'package:flutter/material.dart';
import './reminder_animal.dart';
import '../main.dart';

class ReminderStructure extends StatelessWidget {
  final double deviceHeight;
  final String topic;
  final ReminderAnimal fstAnimal;
  final ReminderAnimal sndAnimal;
  final ReminderAnimal trdAnimal;
  final ReminderAnimal fthAnimal;

  ReminderStructure({
    required this.deviceHeight,
    required this.topic,
    required this.fstAnimal,
    required this.sndAnimal,
    required this.trdAnimal,
    required this.fthAnimal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: deviceHeight * 0.01),
        Container(
          height: deviceHeight * 0.04,
          child: Text(
            topic,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Container(
          height: deviceHeight * 0.45,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [fstAnimal, sndAnimal],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [trdAnimal, fthAnimal],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.greenTambourine,
                      backgroundColor: AppColor.whiteColor),
                  onPressed: () {},
                  child: Text('See More'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
