import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class TinyCardHorizontal extends StatelessWidget {
  TinyCardHorizontal(
      {this.title = "",
      this.action = "",
      this.img = "",
      this.tap = defaultFunc});

  final String img;
  final Function tap;
  final String title;
  final String action;

  static void defaultFunc() {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 3,
            shadowColor: AllColors.muted.withOpacity(0.22),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0)),
                          image: DecorationImage(
                            image: AssetImage(img),
                            fit: BoxFit.contain,
                          ))),
                ),
                Flexible(
                    flex: 6 ,
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 2, bottom: 2),
                            child: Text(title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: AllColors.secondary,
                                ))))),
                Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RaisedButton(
                              textColor: AllColors.white,
                              color: AllColors.time,
                              onPressed: tap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, right: 0.0, top: 2, bottom: 2),
                                  child: Text(action,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0))),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
