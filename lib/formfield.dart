import 'package:flutter/material.dart';

class SingleForm extends StatefulWidget {
  @override
  _SingleFormState createState() => _SingleFormState();
}

class _SingleFormState extends State<SingleForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
    );
  }
}

