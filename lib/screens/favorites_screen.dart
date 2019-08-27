import "package:flutter/material.dart";
import "../models/meal.dart";
import "../widgets/meal_item.dart";
class FavoritesScreen extends StatelessWidget{
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(favoriteMeals.isEmpty)
    {
      return Center(child: Text("No Favorites Add"),);
    }else{
      return ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                
              );
            },
            itemCount: favoriteMeals.length);
  
    }
  }
  
}