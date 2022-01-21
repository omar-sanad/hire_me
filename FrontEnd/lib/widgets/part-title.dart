import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class PartTitle extends StatelessWidget {
  PartTitle(
      {this.title = ""});

  final String title;

  static void defaultFunc() {
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16.0, right: 16.0, top: 12, bottom: 2),
        child:
        Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28)
                )
            ),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff9b59b6), Color(0xff8e44ad)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28)
                  )
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: 340.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                 title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
