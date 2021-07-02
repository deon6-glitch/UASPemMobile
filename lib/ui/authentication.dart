import 'dart:ui';

import 'package:bukuku/net/flutterfire.dart';
import 'package:bukuku/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
         children:<Widget> [
           Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Selamat Datang di Buku-ku!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,color: Colors.white,
                  )
                ),
                SizedBox(
                  height: 15,
                  child: Container(),
                ),
                  Text("silahkan register atau login ke akun anda",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    )
                  ),
                Container(
                  width: 230,
                  height: 230,
                  child: new Image.asset("images/book.png"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    controller: _emailField,
                    decoration: InputDecoration(
                      hintText: "something@email.com",
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Container(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  child: Container(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate = 
                          await register(_emailField.text, _passwordField.text);
                      if(shouldNavigate){
                        //Navigate
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),
                          ),
                        );
                      } 
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Container(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate = 
                          await signIn(_emailField.text, _passwordField.text);
                      if(shouldNavigate){
                        //Navigate
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),
                          ),
                        );
                      } 
                    },
                    child: Text(
                      "login",
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
        ),
    );
  }
}