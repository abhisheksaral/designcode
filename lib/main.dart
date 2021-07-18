import 'package:designcode/constants.dart';
import 'package:designcode/screens/sidebar_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'components/cards/recent_course_card.dart';
import 'model/course.dart';

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
                RecentCourseCard(course: recentCourses[0],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

class SearchFieldWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 33),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0,12),
                  blurRadius: 16
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                cursorColor: kPrimaryLabelColor,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: kPrimaryLabelColor, size: 20),
                  border: InputBorder.none,
                  hintText: "Search for courses",
                  hintStyle: kSearchPlaceholderStyle,
                ),
                style: kSearchTextStyle,
                onChanged: (newText) {
                  print(newText);
                },
              ),
            ),
          ),
        )
    );
  }
}


class SideBarButton extends StatelessWidget {
  const SideBarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('Sidebar Button Pressed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
          maxWidth: 40,
          maxHeight: 40
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0,12),
                  blurRadius: 16
              )
            ]
        ),
        child: Image.asset('asset/icons/icon-sidebar.png', color: kPrimaryLabelColor,),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
