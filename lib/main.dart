import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              Container(
                width: 42,
                  height: 42,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff00aeff),
                        Color(0xff0076ff)
                      ]
                    )
                  ),
                  child: Icon(Icons.home ,color: Colors.white,)
              ),
              SizedBox(width: 12),
              Container(
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF232629)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


