import 'package:flutter/material.dart';
import 'package:fmarket/main.dart';
import 'package:fmarket/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key? key, required this.kategori}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();

    if (widget.kategori == "Temel Gıda") {
      gosterilecekListe = [
        urunKarti(
          "Zeytin Yağı 1L",
          "49.9 TL",
          "https://cdn.pixabay.com/photo/2014/05/28/00/27/olive-oil-356102_1280.jpg",
          mevcut: true,
        ),
        urunKarti(
          "Süt 1L",
          "12.90 TL",
          "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_1280.jpg",
          //mevcut vermedigimiz icin otomatik olarak false alıp stokta yok yazacak
        ),
        Container(color: Colors.green),
        Container(color: Colors.teal),
      ];
    } else if (widget.kategori == "Şekerleme") {
      gosterilecekListe = [
        Container(color: Colors.red),
        Container(color: Colors.blue),
      ];
    } else if (widget.kategori == "İçecekler") {
      gosterilecekListe = [
        Container(color: Colors.teal),
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
      ];
    } else if (widget.kategori == "Temizlik") {
      gosterilecekListe = [
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.teal),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimYolu,
      {bool mevcut = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: isim,
                      fiyat: fiyat,
                      resimYolu: resimYolu,
                      mevcut: mevcut,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: resimYolu,
              child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(resimYolu),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              isim,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              fiyat,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}
