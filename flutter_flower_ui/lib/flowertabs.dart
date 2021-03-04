import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FlowerTab extends StatefulWidget {
  @override
  _FlowerTabState createState() => _FlowerTabState();
}

class _FlowerTabState extends State<FlowerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem("Güller", 4.0, "20", "assets/images/cicek1.jpeg"),
          _buildListItem("Karanfiller", 5.0, "28", "assets/images/cicek2.jpg"),
          _buildListItem("Nilüferler", 3.0, "50", "assets/images/cicek3.jpeg")
        ],
      ),
    );
  }

  _buildListItem(String flowerName, double rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210.0,
            child: Row(
              children: [
                Container(
                  height: 75.5,
                  width: 75.5,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Color(0xffffe3df)),
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
                      style: GoogleFonts.notoSans(fontSize: 14.0, fontWeight: FontWeight.w400),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xffffd143),
                      borderColor: Color(0xffffd143),
                      size: 15.0,
                      spacing: 0.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$" + price,
                          style: GoogleFonts.lato(fontSize: 16.0, fontWeight: FontWeight.w600, textStyle: TextStyle(color: Color(0xfff68d7f))),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          "\$" + "18",
                          style: GoogleFonts.lato(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: flowerName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xfffe7d6a),
          )
        ],
      ),
    );
  }
}
