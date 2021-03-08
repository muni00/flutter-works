import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flower_ui/flowertabs.dart';
import 'package:flutter_flower_ui/flowers_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildPaddingProfile(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "SEARCH FOR",
              style: GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "RECIPES",
              style: GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          SizedBox(height: 25.0),
          searchPace(), // arama çubuğu
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Recommended",
              style: GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 200.0,
            child: buildListViewFlowerCards(),
          ),
          SizedBox(height: 10.0),
          buildPaddingDownTabBar(),
          buildContainerTabss(context),
        ],
      ),
    );
  }

  ListView buildListViewFlowerCards() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _builListItem("Gül", "assets/images/cicek1.jpeg", "21", Color(0xffebd8b7), Color(0xffb68973)),
        _builListItem("Karanfil", "assets/images/cicek2.jpg", "28", Color(0xff99bbad), Color(0xff28527a)),
        _builListItem("Nilüfer", "assets/images/cicek3.jpeg", "50", Color(0xffc6a9a3), Color(0xff8f4f4f))
      ],
    );
  }

  Container buildContainerTabss(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 450.0,
      child: TabBarView(
        controller: tabController,
        children: [
          FlowerTab(),
          FlowerTab(),
          FlowerTab(),
          FlowerTab(),
        ],
      ),
    );
  }

  Padding buildPaddingProfile() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.black),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6.0,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 3.0),
                )
              ],
              color: Color(0xffc6e7fe),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/images/happy_lama.jpg"), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPaddingDownTabBar() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.withOpacity(0.5),
        labelStyle: GoogleFonts.notoSans(fontSize: 16.0, fontWeight: FontWeight.w700),
        unselectedLabelStyle: GoogleFonts.notoSans(fontSize: 12.0, fontWeight: FontWeight.w500),
        tabs: [
          Tab(child: Text("FEATURED")),
          Tab(child: Text("COMBO")),
          Tab(child: Text("FAVORITES")),
          Tab(child: Text("RECOMMENDED")),
        ],
      ),
    );
  }

  Padding searchPace() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
              border: InputBorder.none,
              fillColor: Colors.grey.withOpacity(0.5),
              prefixIcon: Icon(Icons.search, color: Colors.grey)),
        ),
      ),
    );
  }

  _builListItem(String flowerName, String imgPath, String price, Color bgPolor, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RosePage(
              heroTag: flowerName,
              flowerName: flowerName,
              pricePerItem: price,
              imgPath: imgPath,
            ),
          ));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: bgPolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: flowerName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.fill,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                flowerName,
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
