import 'package:flutter/material.dart';

import '../dummy.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 208, 204, 204),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
            spreadRadius: 8,
            blurRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 12, 68, 114),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '# ${index + 1}',
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
