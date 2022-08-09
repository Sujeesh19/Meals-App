import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingScreen extends StatefulWidget {
  static const rounteName = '/settings';

  final Function _saveFilters;
  final Map<String, bool> currentFilters;

  SettingScreen(this.currentFilters, this._saveFilters);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _gluteenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _gluteenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitch(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 65),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> selectedFilter = {
                'gluten': _gluteenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text(
          'Settings',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitch(
                  'Gluten-free',
                  'Only include Gluten Meals',
                  _gluteenFree,
                  (newValue) {
                    setState(
                      () {
                        _gluteenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitch(
                  'Lactose-free',
                  'Only include Lactose Meals',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitch(
                  'Vegetarian',
                  'Only include Vegetarian Meals',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitch(
                  'Vegan',
                  'Only include Vegan Meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
