import 'package:flutter/material.dart';

class WelcomeSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset('assets/images/App Logo.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "App Developed By Teambes Lab",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  TextSpan(
                    text: "\ncopyright @ 2020 Teambeslab,",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
