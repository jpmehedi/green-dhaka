import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/widget/common/input_field_builder.dart';
import 'package:green_dhaka/widget/common/long_button_builder.dart';

class Registration extends StatefulWidget {
  static String PATH = "/Registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _formKey;
  var fieldKey;
  bool _passwordVisible = true;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 50),
                      child: Image.asset('assets/images/logoBig.png'),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InputFieldBuilder(
                            iconName: 'person',
                            textFormField: TextFormField(
                              key: fieldKey,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.check),
                                hintText: 'Please enter your full name',
                                labelText: 'Full name',
                              ),
                              onSaved: (String val) {
                                return val;
                              },
                              validator: (String value) {
                                validateEmail(value);
                                return "";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputFieldBuilder(
                            iconName: 'email',
                            textFormField: TextFormField(
                              key: fieldKey,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.check),
                                hintText: 'Please enter your email',
                                labelText: 'Email address',
                              ),
                              onSaved: (String val) {
                                return val;
                              },
                              validator: (String value) {
                                return value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputFieldBuilder(
                            iconName: 'phone',
                            textFormField: TextFormField(
                              key: fieldKey,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.check),
                                hintText: 'Please enter your phone',
                                labelText: 'Phone number',
                              ),
                              onChanged: (String val) {
                                return val;
                              },
                              validator: (String value) {
                                return value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputFieldBuilder(
                            iconName: 'password',
                            textFormField: TextFormField(
                              key: fieldKey,
                              obscureText: !_passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _passwordVisible = true;
                                    });
                                  },
                                  onLongPressUp: () {
                                    setState(() {
                                      _passwordVisible = false;
                                    });
                                  },
                                  child: Icon(_passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: 'Please enter your email password',
                                labelText: 'Password',
                              ),
                              onSaved: (String val) {
                                return val;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Password needed";
                                }
                                return "";
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      child: LongButtonBuilder(
                        buttonText: 'Create an account',
                        onPressed: () {
                          //TODO registration functionality
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("By signing up, you agree to our"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Terms ',
                                    style: TextStyle(
                                      color: MyColor.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(' and '),
                                  Text(' Conditions of Use',
                                      style: TextStyle(
                                        color: MyColor.primary,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
