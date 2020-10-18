import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';

class OfferCartBuilder extends StatelessWidget {
  const OfferCartBuilder({
    Key key,
    @required this.imageID,
    this.foodName,
  }) : super(key: key);

  final String imageID;
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
            ),
            child: Image.asset(
              'assets/images/flower$imageID.png',
              width: 240,
              height: 129,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Discount",
                  style: TextStyle(
                    color: MyColor.primary,
                    fontSize: 14,
                  ),
                ),
                Text("15%",
                    style: TextStyle(
                      color: MyColor.primary,
                      fontSize: 35,
                    )),
                Text("View details",
                    style: TextStyle(
                      color: MyColor.primary,
                      fontSize: 14,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
