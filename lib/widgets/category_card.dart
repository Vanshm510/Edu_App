import 'package:animations/animations.dart';
import 'package:elearning/constant/color_pallete.dart';
import 'package:elearning/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Widget goTo;

  const CategoryCard({super.key, required this.category, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      openElevation: 4,
      closedBuilder: (context, action) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(category.thumbnail),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.0,
                spreadRadius: 0.05),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                category.name,
                style: kTitleTextStyle,
              ),
              Text(
                "${category.noOfCourses.toString()} courses",
                style: TextStyle(
                  color: kTextColor.withOpacity(0.8),
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ],
          ),
        ),
      ),
      openBuilder: (context, action) {
        return goTo;
      },
    );
  }
}
