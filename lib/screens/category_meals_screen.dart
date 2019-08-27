import "package:flutter/material.dart";
import '../widgets/meal_item.dart';
import "../dummy_data.dart";
import "../models/meal.dart";

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
 List<Meal> availableMeals;
 CategoryMealsScreen(this.availableMeals); 
  static const routeName = '/category-meals';
  
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  bool _loadedInitData=false;
  // void _removeMeal(String mealId) {
  //   setState(() {
  //     widget.availableMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  void initState() {
    super.initState();
   
  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData)
    {
 final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['categoryId'];
    title = routeArgs['title'];
    print(routeArgs);
    widget.availableMeals = widget.availableMeals.where((meal) {
      print(categoryId);
      return meal.categories.contains(categoryId);
    }).toList();
    }
    _loadedInitData=true;
    super.didChangeDependencies();
    

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: widget.availableMeals[index].id,
                title: widget.availableMeals[index].title,
                imageUrl: widget.availableMeals[index].imageUrl,
                duration: widget.availableMeals[index].duration,
                complexity: widget.availableMeals[index].complexity,
                affordability: widget.availableMeals[index].affordability,
                
              );
            },
            itemCount: widget.availableMeals.length));
  }
}
