import 'package:flutter/material.dart';

import '../constants.dart';

class SideBarButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('Sidebar Button Pressed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16)
            ]),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}