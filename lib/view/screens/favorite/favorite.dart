import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/controllers/cart.controller.dart';
import 'package:green_dhaka/product_details/product_details.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_bottom_bar.dart';
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final cartConntroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return BaseNavLayout(
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
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Favorites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 30,),
                  ...cartConntroller.wishlist.map((element) => FavoriteCartBuilder(product: element)).toList()
                  
                ],
              ),
            ),
          ),
        ),
    );
  
  }
}

class FavoriteCartBuilder extends StatelessWidget {
  FavoriteCartBuilder({this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (_)=> ProductDetails(product: product,));
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Route route = MaterialPageRoute(builder: (_)=> ProductDetails(product: product,));
              Navigator.push(context, route);
            },
            child: Card(
              elevation: 3,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                       child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(product['image']),
                        ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      flex: 8,
                        child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product['product-name'],
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                            ),
                            Text(product['product-details'],overflow: TextOverflow.ellipsis,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product['product-price'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                                GestureDetector(
                                  onTap: (){
                                    Route route = MaterialPageRoute(builder: (_)=> ProductDetails());
                                    Navigator.push(context, route);
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    decoration: BoxDecoration(                           
                                      color: MyColor.primary,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Icon(Icons.arrow_forward_ios,color: MyColor.whitish,size: 24,),
                                  )
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),  
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}