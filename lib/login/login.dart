import 'package:flutter/material.dart';
import 'package:green_dhaka/registration/registration.dart';
import 'package:green_dhaka/widget/common/input_field_builder.dart';
import 'package:green_dhaka/widget/common/long_button_builder.dart';
import 'package:green_dhaka/widget/common/social_button_builder.dart';
import 'package:green_dhaka/constraint/color.dart';

class LoginScreen extends StatefulWidget {
  static String PATH = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey;
  var fieldKey;
  bool _passwordVisible = true;
  bool emailValid;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          //reverse: true,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 240,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/login_modal.png",
                        width: 450,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              //TODO sign up functionality
                              Navigator.pushNamed(context, Registration.PATH);
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: MyColor.whitish, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Center(
                              child: Image.asset("assets/images/logo"
                                  ".png"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome!",
                          style: TextStyle(
                            fontFamily: 'arial',
                            letterSpacing: 3,
                            fontWeight: FontWeight.normal,
                            color: MyColor.textColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InputFieldBuilder(
                                iconName: 'email',
                                textFormField: TextFormField(
                                  key: fieldKey,
                                  controller: _textEditingController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    border: InputBorder.none,
                                    focusColor: MyColor.primary,
                                    suffixIcon: Icon(Icons.check),
                                    hintText: 'Please enter your email or '
                                        'phone',
                                    labelText: 'Email or Phone',
                                  ),
                                  onChanged: (String val) {
                                    return val;
                                  },
                                  validator: (String value) {
                                    var email = "tony@starkindustries.com";
                                    emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(email);
                                    if (value.isEmpty) {
                                      return 'Email number is '
                                          'required';
                                    }
                                    if (emailValid == false) {
                                      return 'Wrong email';
                                    }
                                    return " ";
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
                                    hintText: 'Please enter your password',
                                    labelText: 'Password',
                                  ),
                                  onSaved: (String val) {
                                    return val;
                                  },
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (value.length < 6) {
                                      return 'Password too short.';
                                    }
                                    return "";
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //TODO do something
                                },
                                child: Container(
                                  child: Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                        color: MyColor.primary,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "arial",
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              LongButtonBuilder(
                                buttonText: 'Continue',
                                onPressed: () {
                                  //TODO Do something
//                                  if (_formKey.currentState.validate()) {
//                                    setState(() {
//                                      print("Email is right");
//                                    });
//                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "or sign in with",
                                    style: TextStyle(
                                        color: MyColor.textColor,
                                        fontFamily: "arial",
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: SocialButtonBuilder(
                                        onPressed: () {
                                          //TODO Do something
                                        },
                                        socialButtonName: 'Facebook',
                                        socialIconName: 'facebook',
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: SocialButtonBuilder(
                                        onPressed: () {
                                          //TODO Do something
                                        },
                                        socialButtonName: 'Google',
                                        socialIconName: 'google',
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
