import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RosePage extends StatefulWidget {
  final String imgPath, flowerName, pricePerItem, heroTag;

  RosePage({this.imgPath, this.flowerName, this.pricePerItem, this.heroTag});

  @override
  _RosePageState createState() => _RosePageState();
}

class _RosePageState extends State<RosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xfffe7d6a).withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 0.4),
                        )
                      ], color: Color(0xfffe7d6a), shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
