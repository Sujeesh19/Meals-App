import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageurl;

  CategoryItem(this.id, this.title, this.color, this.imageurl);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategroyMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageurl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
          ),
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 3, 3, 70).withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
