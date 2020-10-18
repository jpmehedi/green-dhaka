import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/sidebar/sidebar.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
import 'package:green_dhaka/widget/common/custom_bottom_bar.dart';
import 'package:green_dhaka/widget/common/offer_card_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: SideBar(),
        ),
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
                    child: GestureDetector(
                      child: Image.asset('assets/images/menu.png'),
                      onTap: () => _scaffoldKey.currentState.openDrawer(),
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
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 44,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            suffixIcon: Icon(Icons.search),
                            labelText: "Search for a restaurant ...",
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
                    SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            //TODO
                          },
                          child: Container(
                            child: Icon(
                              Icons.filter_list,
                              size: 44,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Offer',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MyColor.textColor,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff2F434C),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    //TODO
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 30,
                                      color: MyColor.textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 140,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            OfferCartBuilder(
                              imageID: '1',
                              foodName: 'ITALIAN',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            OfferCartBuilder(
                              imageID: '1',
                              foodName: 'ITALIAN',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            OfferCartBuilder(
                              imageID: '1',
                              foodName: 'ITALIAN',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            OfferCartBuilder(
                              imageID: '1',
                              foodName: 'ITALIAN',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          onTapHome: () {},
          onTapProduct: () {
//          Route route = MaterialPageRoute(builder: (context) => CartScreen());
//          Navigator.push(context, route);
          },
        ),
      ),
    );
  }
}
