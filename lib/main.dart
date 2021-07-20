import 'package:designcode/constants.dart';
import 'package:flutter/material.dart';
import 'components/home_screen_navbar.dart';
import 'components/lists/explore_course_list.dart';
import 'components/lists/recent_course_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Recent', style: kLargeTitleStyle),
                      SizedBox(height: 5),
                      Text('23 Courses, more coming', style: kSubtitleStyle)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RecentCourseList(),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 25,
                      bottom: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Explore', style: kTitle1Style),
                    ],
                  ),
                ),
                ExploreCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



