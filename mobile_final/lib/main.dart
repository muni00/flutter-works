import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Image.asset('assets/background.png'),
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 50,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            someCusTextField(false, 'Ad Soyad', Icons.accessibility_new),
                            SizedBox(height: 8.0),
                            someCusTextField(false, 'Telefon', Icons.phone),
                            SizedBox(height: 8.0),
                            someCusTextField(false, 'Ögr. no.', Icons.assignment_ind_outlined),
                            SizedBox(height: 8.0),
                            someCusTextField(false, 'Email', Icons.email_outlined),
                            SizedBox(height: 8.0),
                            _indicator()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextField someCusTextField(bool obscureText, String hintText, IconData icon) {
    return TextField(
      style: TextStyle(
        color: Colors.indigo,
      ),
      cursorColor: Colors.indigo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.indigo,
        ),
        hintText: hintText,
        prefixText: " ",
        hintStyle: TextStyle(color: Colors.indigo),
        focusColor: Colors.indigo,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
      ),
    );
  }

  _indicator() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFFE84545)),
                value: 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
