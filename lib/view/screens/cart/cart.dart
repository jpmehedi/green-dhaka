import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/models/cart.dart';
import 'package:green_dhaka/view/screens/checkout/checkout.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

    var cartProducts = Cart().getCart;
  
  getCartProducts() {

  }

  getTotal() {
    var total = 0;
    cartProducts.forEach((item) {
      total += item['total-price'];
    });
    return total.toString();
  }

  @override
  initState() {

  }

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
                            Text(getTotal(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: MyColor.whitish),),
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
                ...cartProducts.map((item) {
                  return Card(
                  elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(item['image']),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['product-name'],
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                  ),
                                  Text(item['product-details'],overflow: TextOverflow.ellipsis,),
                                  Text(item['total-price'].toString() + " TK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: MyColor.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.remove,color: MyColor.whitish,size: 24,),
                                          )
                                        ),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Text(item['quantity'].toString()),
                                        ),
                                        SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: MyColor.primary,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.add,color: MyColor.whitish,size: 24,),
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                }).toList()
              
              ],
            ),
          ),
        ),
    );
  }
}

