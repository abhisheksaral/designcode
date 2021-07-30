import 'package:designcode/model/course.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0)),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(color: kShadowColor, offset: Offset(0.0, -12), blurRadius: 32.0)
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 16),
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                    color: Color(0xffc5cbd6),
                    borderRadius: BorderRadius.circular(2)
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text('Continue Watching', style: kTitle2Style,),
          ),
          ContinueWatchingList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text('Certificates', style: kTitle2Style,),
          ),
        ],
      ),
    );
  }
}

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
              return ContinueWatchingCard(course: continueWatchingCourses[index]);
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



class ContinueWatchingCard extends StatelessWidget {

  ContinueWatchingCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: course.background,
                  borderRadius: BorderRadius.circular(41),
                  boxShadow: [
                    BoxShadow(
                        color: course.background.colors[0].withOpacity(0.3),
                        offset: Offset(0,20),
                        blurRadius: 30
                    ),
                    BoxShadow(
                        color: course.background.colors[1].withOpacity(0.3),
                        offset: Offset(0,20),
                        blurRadius: 30
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: Container(
                  height: 140.0,
                  width: 260.0,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('asset/illustrations/${course.illustration}',
                                fit: BoxFit.cover ,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              course.courseTitle,
                              style: kCardTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(color: kShadowColor, offset: Offset(0,4), blurRadius: 16),
                ]
            ),
            padding: EdgeInsets.only(top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
            child: Image.asset('asset/icons/icon-play.png'),
          )
        ],
      ),
    );
  }
}
