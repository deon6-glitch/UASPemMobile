import 'package:bukuku/ui/books_reviews.dart';
import 'package:bukuku/ui/write_reviews.dart';
import 'package:bukuku/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
       backgroundColor: Colors.blueAccent,
       body: Container(
         decoration: BoxDecoration(
           color: Colors.black26,
         ),
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: Center(
           child: Column(
             children: [
               SizedBox(
                  height: 40,
                  child: Container(),
                ),
               Text(
                 "~Selamat Menjelajah~",
                 style: TextStyle(
                   fontSize: 27,
                   color: Colors.white,
                 ),
               ),
               SizedBox(
                  height: 65,
                  child: Container(),
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.shade100,
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(right: 15.0, bottom: 25.0),
                      child: InkWell(
                        onTap: (){},
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.person_sharp,
                                  size: 70,
                                  color: Colors.blueAccent.shade100,
                                ),
                                Text('Profile',
                                    style: TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                          )
                          ,),
                      ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.shade100,
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(left: 15.0, bottom: 25.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Reviews()),
                        );
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.book_online_outlined,
                                  size: 70,
                                  color: Colors.blueAccent.shade100,
                                ),
                                Text('Books review',
                                    style: TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                          )
                          ,),
                      ),
                   ),
                 ],
               ),
               Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.shade100,
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Writereviews()),
                        );
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.keyboard_alt_sharp,
                              size: 70,
                              color: Colors.blueAccent.shade100,
                            ),
                            Text('Write review',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                          )
                          ,),
                      ),
                ),
             ],
           )
         ),
       ),
    );
  }
}