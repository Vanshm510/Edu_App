import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int height = 300;

class OnboardingContent {
  final String title;
  final String subtitle;
  final Widget animations;

  OnboardingContent(
      {required this.title, required this.subtitle, required this.animations});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: "Study with Flexible Schedule",
      subtitle:
          "Live and interactive classes with class recordings saved for revisions along with 24/7 doubt solving mentors",
      animations: Image.asset(
        "assets/images/on1.png",
        height: ScreenUtil().setHeight(height),
      )),
  OnboardingContent(
      title: "Be a Profi !",
      subtitle: "Study Smart with the greatest teachers around the world!",
      animations: Image.asset(
        "assets/images/Nerd-amico.png",
        height: ScreenUtil().setHeight(height),
      )),
  OnboardingContent(
      title: "Find a Dream Job!",
      subtitle:
          "Study with us and find your dream job in top tier companies and get your money bak spent on the courses.",
      animations: Image.asset(
        "assets/images/Business deal-amico.png",
        height: ScreenUtil().setHeight(height),
      )),
];
