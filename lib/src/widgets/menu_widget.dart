import 'package:flutter/material.dart';

import 'package:userapppreferences/src/pages/home_page.dart';
import 'package:userapppreferences/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            title: Text('Party Mode'),
            leading: Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('People'),
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
