import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class CardCategory extends StatelessWidget {
  CardCategory(
      {this.title = "",
      this.img = "",
      this.tap = defaultFunc});

  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 252,
        width: null,
        child: GestureDetector(
          onTap: tap,
          child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ))),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)))),
                Center(
                  child: Text(title,
                      style: TextStyle(
                          color: AllColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0)),
                )
              ])),
        ));
  }
}
