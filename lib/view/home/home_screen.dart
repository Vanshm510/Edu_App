import 'package:elearning/constant/color.dart';
import 'package:elearning/models/category.dart';
import 'package:elearning/view/course/course_screen.dart';
import 'package:elearning/widgets/category_card.dart';
import 'package:elearning/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
          child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  height: ScreenUtil().setHeight(210),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/Colors Icon.png",
                        ),
                        alignment: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.5
                        ],
                        colors: [
                          Color(0xFF886FF2),
                          Color(0xFF6849EF),
                        ]),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,\nGood Morning",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          CircleButton(
                            icon: Icons.notifications,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 26,
                          ),
                          suffixIcon: Icon(
                            Icons.mic,
                            color: kPrimaryColor,
                            size: 26,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Seach your topic",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          isDense: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explore Categories",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sell All",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimationLimiter(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        controller: _scrollController,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 24,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        shrinkWrap: true,
                        children: List.generate(categoryList.length, (index) {
                          return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                duration: Duration(milliseconds: 1000),
                                child: FadeInAnimation(
                                    child: CategoryCard(
                                  category: categoryList[index],
                                  goTo: CourseScreen(),
                                )),
                              ));
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
