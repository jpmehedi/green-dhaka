import 'package:flutter/material.dart';
import 'package:green_dhaka/constraint/color.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whitish,
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
        actions: [
          IconButton(
          icon: Icon(Icons.check,color: MyColor.whitish,), 
          onPressed: (){

          },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
            
             Container(
       margin: EdgeInsets.only(top: 100),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: MyColor.success
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           SizedBox(height: 80,),
           Padding(
             padding: const EdgeInsets.only(left: 15),
             child: Text('User Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
           ),
           Divider(
             thickness: 2,
             color: MyColor.primary,
           ),

           Container(  
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border: Border.all(color: MyColor.primary),
               borderRadius: BorderRadius.circular(5)
             ),
            child: TextField ( 
              style: TextStyle(
                  height: 2.0,
                  color: Colors.black                  
                ),
              decoration: InputDecoration(  
                border: InputBorder.none,    
                hintText: 'Name',
                hintStyle: TextStyle(color: MyColor.textColor),
                contentPadding: EdgeInsets.only(left: 10)  
              ),  
            ),
          ),
          
           Container(  
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border: Border.all(color: MyColor.primary),
               borderRadius: BorderRadius.circular(5)
             ),
            child: TextField ( 
              style: TextStyle(
                  height: 2.0,
                  color: Colors.black                  
                ),
              decoration: InputDecoration(  
                border: InputBorder.none,    
                hintText: 'Address',
                hintStyle: TextStyle(color: MyColor.textColor),
                contentPadding: EdgeInsets.only(left: 10,bottom: 10)  
              ),  
            ),
          ),
          
           Container(  
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border: Border.all(color: MyColor.primary),
               borderRadius: BorderRadius.circular(5)
             ),
            child: TextField ( 
              style: TextStyle(
                  height: 2.0,
                  color: Colors.black                  
                ),
              decoration: InputDecoration(  
                border: InputBorder.none,    
                hintText: 'Brithday',
                hintStyle: TextStyle(color: MyColor.textColor),
                contentPadding: EdgeInsets.only(left: 10,bottom: 10)  
              ),  
            ),
          ),
          
           Container(  
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border: Border.all(color: MyColor.primary),
               borderRadius: BorderRadius.circular(5)
             ),
            child: TextField ( 
              style: TextStyle(
                  height: 2.0,
                  color: Colors.black                  
                ),
              decoration: InputDecoration(  
                border: InputBorder.none,    
                hintText: 'Gender',
                hintStyle: TextStyle(color: MyColor.textColor),
                contentPadding: EdgeInsets.only(left: 10,bottom: 10)  
              ),  
            ),
          ),
          
           Container(  
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border: Border.all(color: MyColor.primary),
               borderRadius: BorderRadius.circular(5)
             ),
            child: TextField ( 
              style: TextStyle(
                  height: 2.0,
                  color: Colors.black                  
                ),
              decoration: InputDecoration(  
                border: InputBorder.none,    
                hintText: 'Phone',
                hintStyle: TextStyle(color: MyColor.textColor),
                contentPadding: EdgeInsets.only(left: 10,bottom: 10)  
              ),  
            ),
          ),
          

         ],
       ),
             ),
            Positioned(
      top: 30,
      left: 15,
       child: Container(
         height: 120,
         width: 120,
         child: ClipRRect(
           borderRadius: BorderRadius.circular(10),
           child: Image.asset('assets/images/profile.jpg',fit: BoxFit.fill,),
           ),
        ),          
             ),
            Positioned(
      top: 120,
      left: 110,
       child: Container(
         height: 40,
         width: 40,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: MyColor.primary
         ),
         child: Icon(Icons.add,color: MyColor.whitish,)
        ),          
             ),
            ],
          ),
        ),
    );
  }
}