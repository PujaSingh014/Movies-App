import 'package:movies_app/screens/SignInpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Movies App',
              style: TextStyle(color: Colors.black87, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Images/details_background.jpg'))),
          ),

          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));},
          ),
        ],
      ),
    );
  }
}