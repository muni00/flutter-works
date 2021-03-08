import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LocalJsonKullanimi(),
    );
  }
}

class LocalJsonKullanimi extends StatefulWidget {
  LocalJsonKullanimi({Key key}) : super(key: key);

  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List tumArabalar;

  @override
  void initState() {
    super.initState();
    debugPrint("init state calıştı");
    veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });
  }

// yapılan init veya diğer kontroller yerine future builder kullanılabilir
// future: veriKaynagiOku
// builder : (context,sonuc) if(sonuc.hasData)=> {return ListTile()}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Local Json kullanimi"),
        ),
        body: tumArabalar != null
            ? Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tumArabalar[index]["araba_adi"]),
                      subtitle: Text(tumArabalar[index]["ulke"]),
                    );
                  },
                  itemCount: tumArabalar.length,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Future<List> veriKaynaginiOku() async {
    var gelenJson = await DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    debugPrint(gelenJson);

    List arabaListesi = json.decode(gelenJson.toString());
    debugPrint("toplam araba sayısı : " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka :" + arabaListesi[i]["araba_adi"].toString());
      debugPrint("Ülkesi :" + arabaListesi[i]["ulke"].toString());
    }
    return arabaListesi;
  }
}
