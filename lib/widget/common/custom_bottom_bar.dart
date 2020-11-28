import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.onTapHome, this.onTapFavorite,this.onTapOrderList});
  final Function onTapHome;
  final Function onTapFavorite;
  final Function onTapOrderList;
  bool isSelecteted = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      color: Color(0xffffffff).withOpacity(0.01),
      elevation: 9.0,
      //clipBehavior: Clip.antiAlias,
      child: Container(
        height: 65.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
          color: MyColor.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65.0,
              //margin: EdgeInsets.only(top: 15),
              //width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: MaterialButton(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                onPressed: onTapFavorite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('assets/images/favorite.png'),
                     isSelecteted == true ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColor.secondary
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
            Container(
              height: 65.0,
              //width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: MaterialButton(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                onPressed: onTapHome,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('assets/images/home.png'),
                    isSelecteted == false ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColor.secondary
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
            Container(
              height: 65.0,
              // width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: MaterialButton(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                onPressed: onTapOrderList,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('assets/images/nav_cart.png'),
                      isSelecteted == true ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColor.secondary
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
