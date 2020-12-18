
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_dhaka/view/screens/profile/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  Map<String, dynamic> data;
   final firestoreInstance = FirebaseFirestore.instance.collection("profileInfo");
    Future fetchProfileData()async{
    firestoreInstance.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        setState(() {
          data = result.data();
        });
      print(data);
      });
     });
    }

    @override
    void initState() {
    fetchProfileData();
    super.initState();
    }


  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 150,
          color: MyColor.primary,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColor.whitish,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data != null? data['userName'] : "",
                    style: TextStyle(fontSize: 17, color: MyColor.whitish),
                  ),
                Text(
                    data != null ? data['userPhone'] : "",
                    style: TextStyle(fontSize: 17, color: MyColor.whitish),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  data != null ?IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: MyColor.whitish,
                    ),
                    onPressed: () {
                      Route route = MaterialPageRoute(builder: (_)=> Profile());
                      Navigator.push(context, route);
                    },
                  ) : Container(
                    
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, DoctorList.id);
          },
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, PatientProfile.id);
          },
          child: ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notifications'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, EditProfile.id);
          },
          child: ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rating'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, PatientPayment.id);
          },
          child: ListTile(
            leading: Icon(Icons.place),
            title: Text('Places'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, Appoinments.id);
          },
          child: ListTile(
            leading: Icon(Icons.account_box),
            title: Text('About'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: _launchURL,
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      //Icons.account_box,
                      color: MyColor.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO
                    },
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      //Icons.account_box,
                      color: MyColor.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                        // _launchURL(twitterURL);
                    },
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      //Icons.account_box,
                      color: MyColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
