import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_dhaka/constraint/color.dart';

class SideBar extends StatelessWidget {
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
                    'Mehedi Hasan',
                    style: TextStyle(fontSize: 17, color: MyColor.whitish),
                  ),
                  Text(
                    'Mirpur, Dhaka',
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
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidEdit,
                      color: MyColor.whitish,
                    ),
                    onPressed: () {},
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
                    onPressed: () {
                      //TODO
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: MyColor.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO
                    },
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: MyColor.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO
                    },
                    icon: Icon(
                      FontAwesomeIcons.twitter,
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
