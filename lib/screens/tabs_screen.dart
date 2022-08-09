import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorite_screens.dart';
import '../models/meal.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'DELI Meals',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorties',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //         'Deli Meals',
    //         style: TextStyle(
    //           fontSize: 25,
    //           fontFamily: 'Raleway',
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       centerTitle: true,
    //       backgroundColor: Color.fromARGB(255, 4, 37, 65),
    //       bottom: TabBar(tabs: <Widget>[
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',
    //         ),
    //       ]),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         CategoriesScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 4, 37, 65),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color.fromARGB(255, 5, 45, 79),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 4, 37, 65),
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 4, 37, 65),
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
