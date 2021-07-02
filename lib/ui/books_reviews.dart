import 'package:bukuku/model/book_review.dart';
import 'package:bukuku/net/apiBukuku.dart';
import 'package:bukuku/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Reviews extends StatefulWidget {
  Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
   ApiBukuku? apiBukuku;
  @override
  void initState() {
    super.initState();
    apiBukuku = ApiBukuku();
  }

 @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<List<Review>?>(
          future: apiBukuku!.getReviewAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Review>?> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child: Text("Error ${snapshot.error.toString()}"),
              );
            } else if (snapshot.hasData) {
              List<Review>? _review = snapshot.data;
              if (_review != null) {
                return _buildListView(_review);
              } else {
                return Text("Kosong");
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget _buildListView(List<Review> review) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('E-ULEMAN'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Navbar(),
                ),
              );
          },
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: review.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [        
                          Text(review[index].penulis,
                            textAlign: TextAlign.center,),
                          Text(review[index].judul,
                            textAlign: TextAlign.center,),
                          Text(review[index].genre,
                            textAlign: TextAlign.center,),
                          Text(review[index].section,
                            textAlign: TextAlign.center,),
                          Text(review[index].review,
                            textAlign: TextAlign.center,),
                          Text(review[index].nama,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}






