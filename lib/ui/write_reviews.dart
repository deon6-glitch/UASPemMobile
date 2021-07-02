
// ignore: unused_import
import 'dart:ffi';
// ignore: avoid_web_libraries_in_flutter
// ignore: unused_import


import 'package:bukuku/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Writereviews extends StatefulWidget {
  Writereviews({Key? key}) : super(key: key);

  @override
  _WritereviewsState createState() => _WritereviewsState();
}

class _WritereviewsState extends State<Writereviews> {

  TextEditingController _namaField = TextEditingController();
  TextEditingController _penulisField = TextEditingController();
  TextEditingController _judulField = TextEditingController();
  TextEditingController _genreField = TextEditingController();
  TextEditingController _sectionField = TextEditingController();
  TextEditingController _reviewField = TextEditingController();

  String nama='';
  String penulis='';
  String judul='';
  String genre='';
  String section='';
  String review='';

void _addData(){
  FirebaseFirestore.instance.runTransaction((Transaction transsaction) async{
    CollectionReference reference = FirebaseFirestore.instance.collection("reviews");
    await reference.add({
      "nama" : nama,
      "penulis": penulis,
      "judul" : judul,
      "genre" : genre,
      "section" : section,
      "review" : review,
      
    });
  });
Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         backgroundColor: Colors.blueAccent,
         title: Text(
           "Buku-Ku",
           style: TextStyle(
             color: Colors.black,
           ),
           ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu, 
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Navbar(),
                ),
              );
            },
          ),
       ),
      body: ListView(
        children: [
          Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                  height: 55,
                  child: Container(),
                ),
              Container(
                margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Tuliskan Review Anda~",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
               ),
              SizedBox(
                  height: 15,
                  child: Container(),
                ),
              Container(
                margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    onChanged: (String str) {
                      setState(() {
                        nama=str;
                      });
                    },
                    controller: _namaField,
                    decoration: InputDecoration(
                      hintText: "yang mereview",
                      labelText: "Nama",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
               ),
              Container(
                margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                     onChanged: (String str) {
                      setState(() {
                        penulis=str;
                      });
                    },
                    controller: _penulisField,
                    decoration: InputDecoration(
                      hintText: "Penulis Buku",
                      labelText: "Nama Penulis",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
               ),
               Container(
                 margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                     onChanged: (String str) {
                      setState(() {
                        judul=str;
                      });
                    },
                    controller: _judulField,
                    decoration: InputDecoration(
                      hintText: "Judul Buku",
                      labelText: "Judul Buku",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
               ),
               Container(
                 margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                     onChanged: (String str) {
                      setState(() {
                        genre=str;
                      });
                    },
                    controller: _genreField,
                    decoration: InputDecoration(
                      hintText: "Genre buku",
                      labelText: "Genre",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
               ),
               Container(
                 margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                     onChanged: (String str) {
                      setState(() {
                        section=str;
                      });
                    },
                    controller: _sectionField,
                    decoration: InputDecoration(
                      hintText: "Jenis buku",
                      labelText: "Section",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ),
               ),
               Container(
                 margin: new EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                     onChanged: (String str) {
                      setState(() {
                        review=str;
                      });
                    },
                    controller: _reviewField,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Hasil review buku",
                      labelText: "Review",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
               ),
               Container(
                 margin: new EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      _addData();
                    },
                    child: Text(
                      "submit",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    ),
                ),
            ],
          ),
       ),
        ],
      )
    );
  }
}