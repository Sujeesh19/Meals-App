import 'package:flutter/material.dart';
import '../screens/Settting_screen.dart';
import '../screens/favorite_screens.dart';
import '../screens/saved_meals.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Favorite\'s',
            Icons.star,
            () {
              Navigator.of(context).pushReplacementNamed(SavedScreen.routeName);
            },
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingScreen.rounteName);
            },
          ),
        ],
      ),
    );
  }
}
