import 'package:flutter/material.dart';
import 'package:green_dhaka/checkout/checkout.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: 50,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/cart.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child:GestureDetector(
            onTap: (){
              Route route = MaterialPageRoute(builder: (_)=> CheckoutPage());
              Navigator.push(context, route);
            },
                      child: Container(
                        color: MyColor.primary,
              padding: EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 10),
              height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: MyColor.whitish)),
                            Text("580 TK",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: MyColor.whitish),),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text('Checkout',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: MyColor.whitish)),
                              SizedBox(width: 15,),
                              Container(
                                child: Icon(Icons.arrow_forward,color: MyColor.whitish,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cart",
                  style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColor.textColor
                  ),
                ),
                SizedBox(height: 20,),
                CustomCart(),
                CustomCart(),
              
              ],
            ),
          ),
        ),
    );
  }
}

