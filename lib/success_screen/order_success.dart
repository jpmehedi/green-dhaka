import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/my_order/my_order.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: 50,
          child: Align(
            alignment: Alignment.centerRight,
                      child: Container(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: (){
                  //TODO Do something 
                },
                 child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.cancel),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyColor.success
                  ),
                  child: Icon(Icons.check,size: 50,color: MyColor.primary,),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Order Placed!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Text("Your order was placed successfully. For more details check my order. Thank You",textAlign: TextAlign.center,),
                ),
                SizedBox(height: 30,),
                Container(
                  width: 150,
                  height: 48,
                  child: FlatButton(
                    color: MyColor.primary,
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (_)=> MyOrderPage());
                      Navigator.push(context, route);
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Orders',style: TextStyle(color: MyColor.whitish),),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: MyColor.whitish,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(Icons.arrow_forward_ios,color: MyColor.primary,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}