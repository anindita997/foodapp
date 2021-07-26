import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List category = [
    {"image": "assets/foods/punjabi.jpg", "name": "Punjabi"},
    {"image": "assets/foods/chainese.jpg", "name": "Chainese"},
    {"image": "assets/foods/sindian.jpg", "name": "South Indian"},
    {"image": "assets/foods/ice-cream.jpg", "name": "Ice Cream"},
    {"image": "assets/foods/bangla.jpg", "name": "Bangla"},
    {"image": "assets/foods/italian.jpg", "name": "Italian"},
    {"image": "assets/foods/thai.jpg", "name": "Thai"},
    {"image": "assets/foods/mexican.jpg", "name": "Mexican"},
    {"image": "assets/foods/korean.jpg", "name": "Korean"},
    {"image": "assets/foods/drinks.jpg", "name": "Drinks"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Category", style: TextStyle(color: Colors.black)),
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
              GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,crossAxisSpacing: 10.0,mainAxisSpacing: 10.0
                  ),
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image(image: AssetImage(category[index]["image"])),
                          Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage(category[index]["image"]),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              category[index]["name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
