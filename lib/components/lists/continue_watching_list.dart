import 'package:designcode/components/cards/continue_watching_card.dart';
import 'package:designcode/model/course.dart';
import 'package:flutter/material.dart';


class ContinueWatchingList extends StatefulWidget {
  @override
  _ContinueWatchingListState createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {

  List<Container> indicators = [];
  int currentPage = 0;
  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      continueWatchingCourses.map((course) {
        var index = continueWatchingCourses.indexOf(course);
        return Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? Color(0xff0971fe) : Color(0xffa6aebd)
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.5,
                  child: ContinueWatchingCard(course: continueWatchingCourses[index])
              );
            },
            itemCount: continueWatchingCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicator(),
      ],
    );
  }
}