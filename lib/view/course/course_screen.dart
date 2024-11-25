import 'package:animate_do/animate_do.dart';
import 'package:elearning/constant/color_pallete.dart';
import 'package:elearning/models/dev_course.dart';
import 'package:elearning/view/course/course_details_screen.dart';
import 'package:elearning/widgets/course_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final scrollController = ScrollController();
  bool isBuyCartVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(listen);
  }

  void listen() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = true;
      });
    }
  }

  void hide() {
    if (isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "About the course",
              ),
              toolbarHeight: ScreenUtil().setHeight(60),
              leading: Padding(
                padding: EdgeInsets.all(8),
                child: Ink(
                  height: ScreenUtil().setHeight(35),
                  width: ScreenUtil().setHeight(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 2.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F4EF),
                image: DecorationImage(
                    image: AssetImage("assets/images/ux_big.png"),
                    alignment: Alignment.topRight),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                    child: AnimationLimiter(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: 20,
                          duration: Duration(milliseconds: 500),
                          delay: Duration(milliseconds: 50),
                          child: widget,
                        ),
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          ClipPath(
                            clipper: BestSellerClipper(),
                            child: Container(
                              color: kBestSellerColor,
                              padding: EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade800,
                                highlightColor: Colors.white,
                                child: Text(
                                  "BESTSELLER",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Text(
                            "Development",
                            style: kHeadingTextStyle,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Row(
                            children: [
                              Icon(Icons.people_alt_rounded),
                              SizedBox(
                                width: ScreenUtil().setWidth(5),
                              ),
                              Text(
                                "20K+",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(20),
                              ),
                              Icon(Icons.star_half_rounded),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          RichText(
                            maxLines: 2,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$50",
                                  style: kHeadingTextStyle.copyWith(
                                    fontSize: ScreenUtil().setSp(27),
                                  ),
                                ),
                                TextSpan(
                                  text: " \$100",
                                  style: TextStyle(
                                    color: kTextColor.withOpacity(0.5),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(70)),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeIn(
                                  delay: Duration(milliseconds: 100),
                                  duration: Duration(milliseconds: 500),
                                  child: Text(
                                    "Course Contents",
                                    style: kTitleTextStyle,
                                  ),
                                ),
                                Expanded(
                                    child: AnimationLimiter(
                                        child: ListView.separated(
                                  controller: scrollController,
                                  padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                  ),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: ScreenUtil().setHeight(15),
                                    );
                                  },
                                  itemCount: courses.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                        position: index,
                                        child: SlideAnimation(
                                            horizontalOffset: 50,
                                            duration:
                                                Duration(milliseconds: 700),
                                            delay: Duration(milliseconds: 50),
                                            child: FadeInAnimation(
                                                child: CourseContainer(
                                              course: courses[index],
                                              goTo: CourseDetailsScreen(),
                                            ))));
                                  },
                                )))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(listen);
    super.dispose();
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
