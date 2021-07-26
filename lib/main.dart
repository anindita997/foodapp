import 'package:bottom_indicator_bar/bottom_indicator_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_point_app/HomePage.dart';
import 'package:food_point_app/cartpage.dart';
import 'package:food_point_app/dashboardpage.dart';
import 'package:food_point_app/profilepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Point",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}
class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Category"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Order"),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
  ];
  int _currentIndex=0;
  final List<Widget>_children=[
    Home(),
    Dashboard(),
    Cart(),
    Profile(),
  ];
  void ontappedbar(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontappedbar,
        currentIndex: _currentIndex,
        items: items,
        backgroundColor: Colors.white,
        iconSize:30 ,
        selectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
        selectedItemColor:Colors.orange,
       // unselectedLabelStyle: TextStyle(fontSize: 14.0),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
