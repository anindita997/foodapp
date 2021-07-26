import 'package:flutter/material.dart';
import 'package:food_point_app/formfield.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List payment = [
    {"title": "item total", "price": "128.90"},
    {"title": "delivery charge", "price": "50.90"},
    {"title": "tax", "price": "28.45"},
  ];
  List method = [
    {"title": "Mastercard", "image": "assets/cards/mastercard.png"},
    {"title": "Paypal", "image": "assets/cards/paypal.png"},
    {"title": "Rocket", "image": "assets/cards/rocket.jpg"},
    {"title": "Visa", "image": "assets/cards/visa.jpg"},
  ];
  var isselect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      spreadRadius: 2.0,
                      blurRadius: 2.0)
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: payment.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(payment[index]["title"]),
                                Text(payment[index]["price"]),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "total pay",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("200.00",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: method.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isselect = index;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              color: isselect == index
                                  ? Colors.white
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            children: [
                              Image.asset(
                                method[index]["image"],
                                height: 50.0,
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                method[index]["title"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Card Number",
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(height: 10.0),
                  SingleForm(),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Expire Date",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(height: 10.0),
                          Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: SingleForm()),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Cvv",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(height: 10.0),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child:SingleForm(),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.0),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
