import 'package:flutter/material.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
//import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List slider = [
    {"image": "assets/fd1.jpg"},
    {"image": "assets/fd2.jpeg"},
    {"image": "assets/fd3.jpg"},
  ];
  List horizonlist = [
    {"text": "Burger", "image": "assets/burger.jpg"},
    {"text": "Pizza", "image": "assets/pizza.jpg"},
    {"text": "Hotdog", "image": "assets/hotdog.png"},
    {"text": "Sandwich", "image": "assets/sandwich.jpg"},
  ];
  List food = [
    {"title": "Cheese Burger", "price": "23.00", "image": "assets/burger.jpg"},
    {"title": "Cheese Burger", "price": "23.00", "image": "assets/burger.jpg"},
    {"title": "Cheese Burger", "price": "23.00", "image": "assets/burger.jpg"},
    {"title": "Cheese Burger", "price": "23.00", "image": "assets/burger.jpg"},
  ];

  var isselect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          title: ListTile(
            leading: Icon(
              Icons.room,
              color: Colors.grey,
            ),
            title: Text("New York,USA"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                )),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: CarouselSlider.builder(
                    unlimitedMode: true,
                    itemCount: slider.length,
                    initialPage: 0,
                    enableAutoSlider: false,
                    slideBuilder: (index) {
                      return Image(image: AssetImage(slider[index]["image"]));
                    },
                    // slideTransform: CubeTransform(),
                    slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(top: 220),
                      currentIndicatorColor: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0
                ),
                ListTile(
                  leading: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "See all",
                  ),
                ),
                Container(
                  height: 40,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: horizonlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isselect = index;
                              });
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                color: isselect == index
                                    ? Colors.orange
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  horizonlist[index]
                                                      ["image"]))),
                                    ),
                                    SizedBox(
                                      width: 8.0
                                    ),
                                    Text(
                                      horizonlist[index]["text"],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.0
                ),
                ListTile(
                  leading: Text(
                    "Popular Food",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "See all",
                  ),
                ),
                SizedBox(
                  height: 10.0
                ),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: food.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            margin: EdgeInsets.all(12.0),
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  food[index]["title"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  food[index]["price"],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: -12,
                              left: 70,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(food[index]["image"]),
                                radius: 25,
                              )),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
    );
  }
}
