import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/product_details/product_details.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_bottom_bar.dart';
class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  var orders = [];

  Future getOrders() async {

    // setState(() {
    //   isLoading  = true;
    // });
    firestoreInstance.collection("order-list").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        setState(() {
          orders.add(result.data());
          print(result.id);
        });
      });
    });

    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  initState() {
    super.initState();

    getOrders();
  }

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
                  Text("My Orders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 30,),
                  ...orders.map((e) {
                    return MyOrderCartBuilder(order: e,);
                  })
                ],
              ),
            ),
          ),
        ),
    );
  
  }
}

class MyOrderCartBuilder extends StatelessWidget {
  final order;
  MyOrderCartBuilder({this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
                    child: Image.asset("assets/images/flower10.jpg"),
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
                          "Belconi Box",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                        ),
                        Text("Wooden belconi box with 5 type",overflow: TextOverflow.ellipsis,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${order['total']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
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
        SizedBox(height: 10,),
      ],
    );
  }
}