import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_bottom_bar.dart';

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  var orders = [];
  bool isLoading = false;
  
  var orderID = [] ;


  Future getOrders() async {

    setState(() {
      isLoading  = true;
    });
    await firestoreInstance.collection("order-list").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        setState(() {
          orders.add(result.data());
          orderID.add(result.id);
          print(result.id);
        });
      });
    });

    setState(() {
      isLoading = false;
    });
  }

  getOrderId(){
  
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
        body: !isLoading ? SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Orders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 30,),
                  ...orders.map((order) {
                    return MyOrderCartBuilder(order: order,);
                  })
                ],
              ),
            ),
          ),
        ) : Center(child: CircularProgressIndicator(),),
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
                    child: Image.asset("assets/images/order_history.png"),
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
                          "Order id: SBK1414".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                        Text("Payment Type: ${order['payment_type']}",overflow: TextOverflow.ellipsis,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total taka:   ${order['total']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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