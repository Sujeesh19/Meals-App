import 'package:flutter/material.dart';

import './models/meal.dart';

import './dummy.dart';
import './screens/Settting_screen.dart';
import './screens/saved_meals.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favoriteMeals = [];

  void _setFitlers(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Color.fromARGB(255, 8, 50, 84),
          canvasColor: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              )),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals),
        CategroyMealsScreen.routeName: (ctx) =>
            CategroyMealsScreen(availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        SettingScreen.rounteName: (ctx) => SettingScreen(_filters, _setFitlers),
        SavedScreen.routeName: (ctx) => SavedScreen(favoriteMeals),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },

      // onUnknownRoute: ((settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // }),
    );
  }
}
