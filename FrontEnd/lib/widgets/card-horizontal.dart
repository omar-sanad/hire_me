import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
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
        height: 100,
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
                  flex: 1,
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RaisedButton(
                              textColor: AllColors.white,
                              color: AllColors.primary,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, right: 0.0, top: 2, bottom: 2),
                                  child: Text(title,
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
