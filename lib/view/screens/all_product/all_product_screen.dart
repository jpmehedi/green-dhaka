import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/view/screens/cart/cart.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/product_cart.dart';

class AllProductScreen extends StatefulWidget {
  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {


  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
  final double itemHeight = (size.height) / 2.2;
  final double itemWidth = (size.width) / 2;
    return Scaffold(
      appBar: CustomAppBar(
          height: 120,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        )
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Route route = MaterialPageRoute(builder: (_)=> CartPage());
                                  Navigator.push(context, route);
                                },
                                 child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset('assets/images/cart.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 5,
                           child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.5),
                              color: Colors.red
                            ),
                            child: Center(child: Text("0",style: TextStyle(fontSize: 10,color: MyColor.whitish),)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 44,
                          child: TextFormField(
                            decoration: new InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              labelText: "Search...",
                              labelStyle: TextStyle(color: Colors.black),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    
                    ],
                  ),
              ),
              
            ],
          ),
        ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 15),
        height: MediaQuery.of(context).size.height / 1.2,
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
           childAspectRatio: (itemWidth / itemHeight),
          children: List<Widget>.generate(16, (index) {
            return GridTile(
              child:Container(
                height: 200,
                child: ProductCart(
                  imageID: '10.jpg',
                  productName: "Sun flower",
                  productPrice: "290 \$",
              ),
              )
            );
          }),
        ),
      ),
    ); 
  }
}