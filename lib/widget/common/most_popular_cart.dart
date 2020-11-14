import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';

class MostPopularCart extends StatelessWidget {
  const MostPopularCart(
      {Key key, @required this.imageID, this.productName, this.productPrice})
      : super(key: key);

  final String imageID;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  'assets/images/flower$imageID.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$productName",
                    style: TextStyle(
                        color: MyColor.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("$productPrice",
                          style: TextStyle(
                            color: MyColor.primary,
                            fontSize: 16,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Details",
                              style: TextStyle(
                                color: MyColor.primary,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: MyColor.primary,
                              size: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
