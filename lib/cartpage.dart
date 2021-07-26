import 'package:flutter/material.dart';
import 'package:food_point_app/checkoutpage.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  List cart = [
    {"image": "assets/pizza.jpg", "name": "Veg Rice", "price": "28.90"},
    {"image": "assets/hotdog.png", "name": "Pasta Basta", "price": "28.90"},
    {"image": "assets/pizza.jpg", "name": "Pizza", "price": "28.90"},
  ];
  int _counter =0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add to cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.grey,width: 0.5)
                    ),
                    child: Row(
                      children: [
                        Image.asset(cart[index]["image"], height: 60),
                        SizedBox(width: 20.0),
                        Flexible(
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  cart[index]["name"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orangeAccent[100],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(_counter>0)
                                          {
                                            _counter--;
                                          }
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 8,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "$_counter",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orangeAccent,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _counter++;
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 8,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 80.0),
                                Text(cart[index]["price"])
                              ],
                            ),
                            trailing:  IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 16,
                                ),
                                onPressed: () {}),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 80.0),
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text("Toatal price"),
                      subtitle: Text("120.30",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Checkout()));
                      },
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
