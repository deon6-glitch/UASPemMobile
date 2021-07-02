import 'package:bukuku/ui/books_reviews.dart';
import 'package:bukuku/ui/write_reviews.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
                  height: 80,
                  child: Container(),
                ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () {}
          ),
          ListTile(
            leading: Icon(Icons.folder_open_outlined),
            title: Text('Books Review'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Reviews()),
                        );
            }
          ),ListTile(
            leading: Icon(Icons.keyboard),
            title: Text('Write Reviews'),
            onTap: () {
               Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => Writereviews()),
                        );
            }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}