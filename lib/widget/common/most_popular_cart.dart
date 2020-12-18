import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/product_details/product_details.dart';

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
      child: GestureDetector(
        onTap: (){
          Route route = MaterialPageRoute(builder: (_)=>ProductDetails());
          Navigator.push(context, route);
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    'assets/images/flower$imageID',
                    width: 120,
                    height: 140,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$productName",
                      style: TextStyle(
                          color: MyColor.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerRight,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Price: ",
                              style: TextStyle(
                                color: MyColor.primary,
                                fontSize: 16,
                              ),
                            ),
                          Text(
                            "$productPrice",
                              style: TextStyle(
                                color: MyColor.primary,
                                fontSize: 16,
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: MyColor.primary,
                            size: 16,
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
      ),
    );
  }
}
