import 'package:elearning/constant/color_pallete.dart';
import 'package:elearning/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? Icon(
                Icons.play_circle_rounded,
                size: 45,
                color: kBlueColor,
              )
            : Icon(
                Icons.queue_play_next_rounded,
                size: 45,
                color: Colors.grey,
              ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lesson.duration,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        lesson.isCompleted
            ? Icon(
                Icons.done_rounded,
                size: 30,
                color: Colors.green,
              )
            : Icon(
                Icons.lock,
                size: 30,
                color: Colors.grey.shade500,
              ),
      ],
    );
  }
}
