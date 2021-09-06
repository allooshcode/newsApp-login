import 'package:flutter/material.dart';

class FirstOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/images/alaa.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('bbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
          SizedBox(
            height: 20,
          ),
          Text('first page'),
        ],
      ),
    );
  }
}
