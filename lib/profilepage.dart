import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List list=[
    {"icon":Icons.person,"title":"Account"},
    {"icon":Icons.payment,"title":"Payment Method"},
    {"icon":Icons.settings,"title":"Settings"},
    {"icon":Icons.notifications,"title":"Notifications"},
    {"icon":Icons.logout,"title":"Logout"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
       child: Column(
         children: [
           Stack(
             overflow: Overflow.visible,
             children: [
               Container(
                 height: 130,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: Colors.orange,
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0 ),
                   child: Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                 ),
               ),
               Positioned(
                 top: 90,
                 left: MediaQuery.of(context).size.width/2.5,
                   right: MediaQuery.of(context).size.width/2.5,
                 child:CircleAvatar(
                   backgroundColor: Colors.orange,
                   radius: 40,
                  backgroundImage:AssetImage("assets/pp.jpg"),
                 )
               ),
             ],
           ),
           SizedBox(height: 50.0,),
           Text("John Deo",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
           SizedBox(height: 20.0,),
           ListView.builder(
             shrinkWrap: true,
             itemCount: list.length,
             itemBuilder: (BuildContext context, int index){
               return Card(
                 child: ListTile(
                  leading: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(child: Icon(list[index]["icon"],color: Colors.white,),),
                  ),
                   title: Text(list[index]["title"],),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               );
             },
           )
         ],
       ),
    ),
    );
  }
}
