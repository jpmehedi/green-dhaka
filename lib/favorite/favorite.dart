import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/widget/common/custom_appbar.dart';
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: IconButton(
                      onPressed: (){},
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
                  Text("Favorite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 30,),
                  FavoriteCartBuilder(),
                  FavoriteCartBuilder(),
              
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class FavoriteCartBuilder extends StatelessWidget {
  const FavoriteCartBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
            child: Container(
              height: 120,
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
                            Text("500 TK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: 48,
                                height: 44,
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