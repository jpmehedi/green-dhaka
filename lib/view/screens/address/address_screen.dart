import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_dhaka/constraint/color.dart';


class AddAddressRoute extends StatefulWidget {


  @override
  _AddAddressRouteState createState() => _AddAddressRouteState();
}

class _AddAddressRouteState extends State<AddAddressRoute> {
  final _formKey = GlobalKey<FormState>();
  var addressController = TextEditingController();

  var selectedThana;
  var selectedDistrict;
  var selectedArea;
  var areaID;
  var currentDivisionSelectedValue;


  var locations = [];
  var districts = [];
  var thanas = [];
  var areas = [];
  var tempselectedDistrict;
  var tempselectedThana;
  var tempselectedArea;

  @override
  void initState() {
    super.initState();
    _copertinoDistricList();
    _copertinoThanaList();
    _copertinoAreaList();
  }




  Widget _copertinoDistricList() {
    return CupertinoPicker(
      itemExtent: 32,
      scrollController: FixedExtentScrollController(initialItem: 2),
      magnification: 1.2,
      useMagnifier: true,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedDistrict = value;
        });
      },
      children: getDropDownDistrictItems(),
    );
  }

  Widget _copertinoThanaList() {
    return CupertinoPicker(
      itemExtent: 32,
      scrollController: FixedExtentScrollController(initialItem: 2),
      magnification: 1.2,
      useMagnifier: true,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedThana = value;
        });
      },
      children:getDropDownThanaItems()
    );
  }

  Widget _copertinoAreaList() {
    return CupertinoPicker(
      itemExtent: 32,
      scrollController: FixedExtentScrollController(initialItem: 2),
      magnification: 1.2,
      useMagnifier: true,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedArea = value;
        });
      },
      children: getDropDownDivisionItems()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: MyColor.secondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Add Address",
            style: TextStyle(color: MyColor.secondary),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                 padding: EdgeInsets.only(left: 8.0),
                                child: Row(children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: MyColor.seeGreen, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                   'District',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, right: 15),
                                  child: ButtonTheme(
                                      height: 50,
                                      minWidth: MediaQuery.of(context).size.width,
                                      child: FlatButton(
                                        onPressed: () async {
                                          await showModalBottomSheet<int>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return _copertinoDistricList();
                                              });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: BorderSide(color: MyColor.seeGreen)),
                                        child: Row(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                              ),
                                            ),

                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                 'e.g Dhaka',
                                                style: TextStyle(
                                                    color: Colors.black,
                                              ),
                                            ),
                                            ),

                                          ],
                                        ),
                                      ))),
                              SizedBox(height: 20.0),
                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: MyColor.seeGreen, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                  'Thana',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: FlatButton(
                                    onPressed: () async {
                                      await showModalBottomSheet<int>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return _copertinoThanaList();
                                          });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: MyColor.seeGreen)),
                                    child: Text(
                                      'e. g. Rampura',
                                      style: TextStyle(
                                        color: Colors.black
                                           
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: MyColor.seeGreen, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Area',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: FlatButton(
                                    onPressed: () async {
                                      await showModalBottomSheet<int>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return _copertinoAreaList();
                                          });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: MyColor.primary)),

                                    child: Text(
                                       'e. g. Malibag',
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: MyColor.seeGreen, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                   'Adress',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: (MediaQuery.of(context).size.width * 0.9),
                                decoration: BoxDecoration(
                                    border: Border.all(color: MyColor.primary),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                                child: TextFormField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'SolaimanLipi',
                                      color: new Color(0xFF8c8c8c),
                                      // fontSize: SizeConfig.safeBlockHorizontal * 4,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: MyColor.secondary),
                                    ),
                                    // hintText: LNG_REGISTRATION_P1_NAME
                                  ),
                              
                                  onSaved: (String value) {
                                    // addressController.text = value;
                                  },
                                ),
                              ),
                              SizedBox(height: 10.0),
                               Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(children: <Widget>[
                                  Icon(Icons.phone,
                                      color: MyColor.seeGreen, size: 25.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                   'Mobile',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: (MediaQuery.of(context).size.width * 0.9),
                                decoration: BoxDecoration(
                                    border: Border.all(color: MyColor.primary),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                                child: TextFormField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'SolaimanLipi',
                                      color: new Color(0xFF8c8c8c),
                                      // fontSize: SizeConfig.safeBlockHorizontal * 4,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: MyColor.secondary),
                                    ),
                                    // hintText: LNG_REGISTRATION_P1_NAME
                                  ),
                              
                                  onSaved: (String value) {
                                    // addressController.text = value;
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                padding: EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                   InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 35.0),
                                        decoration: BoxDecoration(
                                            color: MyColor.primary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
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
      ),
    );
  }
}

// Thana dropdown
List _thanas = ["Rampura", "Badda", "Mirpur"];
List<DropdownMenuItem<String>> getDropDownThanaItems() {
  List<DropdownMenuItem<String>> items = new List();
  var i = 0;
  for (String thana in _thanas) {
    items
        .add(new DropdownMenuItem(value: i.toString(), child: Center(child: new Text(thana))));
    i = i + 1;
  }
  return items;
}

// District dropdown
List _districts = ["Dhaka", "Gazipur", "Narayngonj"];
List<DropdownMenuItem<String>> getDropDownDistrictItems() {
  List<DropdownMenuItem<String>> items = new List();
  var i = 0;
  for (String district in _districts) {
    items.add(
        new DropdownMenuItem(value: i.toString(), child: Center(child: new Text(district))));
    i = i + 1;
  }
  return items;
}

// Division dropdown
List _divisions = ["Santinagor", "DOHS", "Baily Road"];
List<DropdownMenuItem<String>> getDropDownDivisionItems() {
  List<DropdownMenuItem<String>> items = new List();
  var i = 0;
  for (String division in _divisions) {
    items.add(
        new DropdownMenuItem(value: i.toString(), child: Center(child: new Text(division))));
    i = i + 1;
  }
  return items;
}
