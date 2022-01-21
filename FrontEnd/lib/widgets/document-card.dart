import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';

class DocumentCard extends StatelessWidget {
  DocumentCard(
      {this.title = "",
        this.date = "",
        this.subject = "",
      this.img = "",
      this.tap = defaultFunc});

  final String img;
  final Function tap;
  final String title;
  final String date;
  final String subject;

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
                    flex: 10,
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
                    flex: 2,
                    child: Center(
                        child:Padding(
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 0, bottom: 0),
                            child: Text(subject,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0, color: AllColors.time,)))
                    )),
                Flexible(
                    flex: 2,
                    child: Center(
                        child:Padding(
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 0, bottom: 0),
                            child: Text(date,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10.0, color: AllColors.secondary,)))
                    )),
                Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, left: 2.0, right: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RaisedButton(
                              textColor: AllColors.white,
                              color: AllColors.primary,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(42.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 1.0, right: 1.0, top: 1, bottom: 1),
                                  child: Text(title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0))),
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
