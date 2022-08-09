import 'package:flutter/material.dart';

import '../dummy.dart';
import '../widgets/Category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(18),
      children: Dummy_Categoris.map(
        (catData) => CategoryItem(
          catData.id,
          catData.title,
          catData.color,
          catData.image,
        ),
      ).toList(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 150,
        childAspectRatio: 1.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
      ),
    );
  }
}
