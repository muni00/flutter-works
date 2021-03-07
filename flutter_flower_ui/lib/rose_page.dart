import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RosePage extends StatefulWidget {
  final String imgPath, flowerName, pricePerItem, heroTag;

  RosePage({this.imgPath, this.flowerName, this.pricePerItem, this.heroTag});

  @override
  _RosePageState createState() => _RosePageState();
}

class _RosePageState extends State<RosePage> {
  var quantity = 1;
  var netPrice = 0.0;
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
                buildStackAppBar()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.flowerName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Column(
                children: [buildStackFavouriteBorder(), SizedBox(height: 35.0), buildStackRestore()],
              )
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "\$" + (int.parse(widget.pricePerItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                      fontSize: 40.0,
                      color: Color(0xff5e6166),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xfffe7d6a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.0,
                      width: 105.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17.0,
                            icon: Icon(Icons.remove, color: Color(0xfffe7d6a)),
                            onPressed: () {
                              adjustQuantity('MINUS');
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                              fontSize: 14.0,
                              color: Color(0xfffe7d6a),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            iconSize: 17.0,
                            icon: Icon(Icons.add, color: Color(0xfffe7d6a)),
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Add to cart",
                      style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
              height: 225.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildListItemi("1"),
                  _buildListItemi("2"),
                ],
              ))
        ],
      ),
    );
  }

  _buildListItemi(String columNumber) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          if (columNumber == "1") _buildColumnItem("assets/images/cicek1.jpeg", "Sweet Rose", "11", Color(0xfffbd6f5)),
          SizedBox(height: 5.0),
          if (columNumber == "1") _buildColumnItem("assets/images/cicek2.jpg", "Sweet Karanfil", "11", Color(0xfffbd6f5)),
          SizedBox(height: 5.0),
          if (columNumber == "2") _buildColumnItem("assets/images/cicek1.jpeg", "Sweet Rose", "11", Color(0xfffbd6f5)),
          SizedBox(height: 5.0),
          if (columNumber == "2") _buildColumnItem("assets/images/cicek2.jpg", "Sweet Karanfil", "11", Color(0xfffbd6f5))
        ],
      ),
    );
  }

  _buildColumnItem(String imgPath, String flowerName, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: bgColor),
                child: Center(
                  child: Image.asset(
                    imgPath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flowerName,
                    style: GoogleFonts.notoSans(fontSize: 14.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$" + price,
                    style: GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.w600, textStyle: TextStyle(color: Color(0xfffe7d6a))),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case "PLUS":
        setState(() {
          quantity += 1;
        });
        return;
      case "MINUS":
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }

  Stack buildStackFavouriteBorder() {
    return Stack(
      children: [
        Container(
          height: 45.0,
          width: 40.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), boxShadow: [
            BoxShadow(
              color: Color(0xfffe7d6a).withOpacity(0.1),
              blurRadius: 6.0,
              spreadRadius: 6.0,
              offset: Offset(5.0, 11.0),
            )
          ]),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: Center(
            child: Icon(
              Icons.favorite_border,
              color: Color(0xfffe7d6a),
              size: 25.0,
            ),
          ),
        )
      ],
    );
  }

  Stack buildStackRestore() {
    return Stack(
      children: [
        Container(
          height: 45.0,
          width: 40.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), boxShadow: [
            BoxShadow(
              color: Color(0xfffe7d6a).withOpacity(0.1),
              blurRadius: 6.0,
              spreadRadius: 6.0,
              offset: Offset(5.0, 11.0),
            )
          ]),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: Center(
            child: Icon(
              Icons.restore,
              color: Color(0xfffe7d6a),
              size: 25.0,
            ),
          ),
        )
      ],
    );
  }

  Stack buildStackAppBar() {
    return Stack(
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
              color: Colors.white,
            ),
          ),
        ),
        buildPositionedAppBar()
      ],
    );
  }

  Positioned buildPositionedAppBar() {
    return Positioned(
      top: 1.0,
      right: 4.0,
      child: Container(
        height: 12.0,
        width: 12.0,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Text(
            "1",
            style: GoogleFonts.notoSans(fontSize: 7.0, textStyle: TextStyle(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
