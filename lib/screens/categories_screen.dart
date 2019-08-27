import "package:flutter/material.dart";
import "../dummy_data.dart";
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(children: DUMMY_CATEGORIES.map((categoryData){
       return CategoryItem(categoryData.id,categoryData.title, categoryData.color); 
    }).toList(),gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
    childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20),padding: EdgeInsets.all(15),);
  }

}