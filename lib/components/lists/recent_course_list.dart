import 'dart:io';
import 'package:designcode/components/cards/recent_course_card.dart';
import 'package:designcode/model/course.dart';
import 'package:designcode/screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({Key? key}) : super(key: key);

  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map(
            (course) {
          var index = recentCourses.indexOf(course);
          return Container(
            width: 7,
            height: 7,
            margin: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
                    ? Color(0xff0971fe)
                    : Color(0xffa6aebd)),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseScreen(course: recentCourses[index]),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Blur(
                  blur: currentPage == index ? 0 : 5,
                  colorOpacity: 0,
                  alignment: Alignment.centerRight,
                  child: Opacity(
                      opacity: currentPage == index ? 1.0 : 0.5,
                      child: RecentCourseCard(course: recentCourses[index])
                  ),
                ),
              );
            },
            itemCount: recentCourses.length,
            controller: PageController(
                initialPage: 0,
                viewportFraction: Platform.isIOS ? 0.63 : 0.67
            ),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
