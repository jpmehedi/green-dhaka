import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/view/screens/home/home_page.dart';
import 'package:green_dhaka/view/screens/success_screen/order_success.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_cart.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override

  bool isCashPayment = false;
  bool ePayment = false;
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          height: 50,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){
                          Route route = MaterialPageRoute(builder: (_)=>HomePage());
                          Navigator.push(context, route);
                        },
                        icon: Icon(Icons.cancel,size: 30,),
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
              Route route = MaterialPageRoute(builder: (_)=> OrderSuccess());
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
                    Text('Place order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: MyColor.whitish)),
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
  body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping Address',style: TextStyle(color: MyColor.textColor,fontSize: 16 ),),
                        Text("Mehedi Hasan",style: TextStyle(color: MyColor.textColor,fontSize: 16,fontWeight: FontWeight.bold )),
                        Text("160/ A, Green Road, Dhaka",style: TextStyle(color: MyColor.textColor,fontSize: 16 )),
                        Text("Bangladesh",style: TextStyle(color: MyColor.textColor,fontSize: 16 )),
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: (){},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: MyColor.primary,
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Icon(Icons.arrow_forward_ios,color: MyColor.whitish,),
                      ),
                  )
                ],
              ),
            ),
          
            SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Payment Method',style: TextStyle(color: MyColor.textColor,fontSize: 20,fontWeight: FontWeight.bold )),
                InkWell(
                  onTap: (){
                    setState(() {
                      isCashPayment = true;
                      ePayment = false;
                    });
                    
                  },
                    child: Card(
                      color: isCashPayment ? MyColor.primary : MyColor.whitish,
                      child: Container(
                      height: 44,
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Row(  
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(width: 10,),
                                  Text("Cash on delivery"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                        ),
                    ),
                  ),
                ),
             
                InkWell(
                  onTap: (){
                    setState(() {
                      ePayment = true;
                      isCashPayment = false;
                    });
                  },
                   child: Card(   
                      color: ePayment ? MyColor.primary : MyColor.whitish,
                      child: Container(
                        height: 44,
                        padding: EdgeInsets.only(left: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(  
                                  children: [
                                    Icon(Icons.credit_card),
                                    SizedBox(width: 10,),
                                    Text("MasterCard"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
           
              ],
            ),
            SizedBox(height: 15,),
            Text('Order Items',style: TextStyle(color: MyColor.textColor,fontSize: 20,fontWeight: FontWeight.bold )),
            SizedBox(height: 15,),
            CustomCart(),
            SizedBox(height: 15,),
            CustomCart(),
            SizedBox(height: 15,),
            Container(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: MyColor.primary)
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(
                    child: Container(  
                      child: TextField ( 
                        style: TextStyle(
                            height: 2.0,
                            color: Colors.black                  
                          ),
                        decoration: InputDecoration(  
                          border: InputBorder.none,    
                          hintText: 'Coupon Code',
                          contentPadding: EdgeInsets.only(left: 10,bottom: 10)  
                        ),  
                        ),
                    ),
                  ),  
                  RawMaterialButton(
                    onPressed: (){},
                    child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: MyColor.primary,
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 5,),
                        Text("Apply Coupon",style: TextStyle(color: MyColor.whitish,fontSize: 16),),
                        Icon(Icons.arrow_forward_ios,color: MyColor.whitish,),
                      ],
                    ),
                    ),
                ),
                SizedBox(width: 1,),
              ],
            ),
          ),
          
            ],
        ),
      ),
    ),
  ),

    );
    
  }
}