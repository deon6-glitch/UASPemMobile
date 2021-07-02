// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bukuku/model/book_review.dart';

class ApiBukuku {
  final url = "http://lonecrabs.000webhostapp.com/AppBukuku/getListUndangan.php";
  Future<List<Review>?> getReviewAll() async{
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return reviewFromJson(response.body);
    } else {
      print("Error ${response.toString()}");
      return null;
    }
  }
}