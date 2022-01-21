import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
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
    return Flexible(
        child: Container(
      height: 200,
      child: GestureDetector(
        onTap: tap,
        child: Card(
            elevation: 3,
            shadowColor: AllColors.muted.withOpacity(0.3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 18,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0)),
                            image: DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit.contain,
                            )))),
                Flexible(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RaisedButton(
                              textColor: AllColors.white,
                              color: AllColors.primary,
                              onPressed: tap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 2.0, right: 2.0, top: 2, bottom: 2),
                                  child: Text(title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0))),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    ));
  }
}
