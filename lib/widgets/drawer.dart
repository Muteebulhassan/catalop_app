import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://images.unsplash.com/photo-1498758536662-35b82cd15e29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              accountName: Text("Muteeb"),
              accountEmail: Text("Muteeb@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 10,
            leading: Icon(
              CupertinoIcons.house_fill,
              color: Colors.black87,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 10,
            leading: Icon(
              CupertinoIcons.folder_fill,
              color: Colors.black87,
            ),
            title: Text(
              "Catagories",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 10,
            leading: Icon(
              CupertinoIcons.gear_solid,
              color: Colors.black87,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: -92,
            leading: Icon(
              CupertinoIcons.square_arrow_left_fill,
              color: Colors.black87,
            ),
            title: TextButton(onPressed: () => Navigator.pushNamed(context, MyRoutes.logOut),
            
              child: Text(
                "Log Out",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
