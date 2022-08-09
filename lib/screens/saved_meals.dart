import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class SavedScreen extends StatelessWidget {
  static const routeName = '/saved';
  final List<Meal> favoriteMeals;
  SavedScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 65),
        centerTitle: true,
        title: Text(
          'Your Favorites',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: favoriteMeals.isEmpty
            ? Center(
                child: Text('The Favorite Food'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                  );
                },
                itemCount: favoriteMeals.length,
              ),
      ),
    );
  }
}
