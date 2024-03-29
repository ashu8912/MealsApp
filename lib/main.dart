import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import "./screens/categories_screen.dart";
import './screens/category_meals_screen.dart';
import "./screens/tabs_screen.dart";
import "./dummy_data.dart";
import "./models/meal.dart";
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];
  void _toggleFavorite(mealId)
  {
    final existingIndex=_favoriteMeals.indexWhere((meal)=>meal.id==mealId);
    if(existingIndex>=0)
    {
      setState((){
        {_favoriteMeals.removeAt(existingIndex);}
      });
    }else{
      setState((){_favoriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
    });
  }
    }
  bool _isMealFavorite(mealId)
  {
     return _favoriteMeals.any((meal)=>meal.id==mealId);
  }
  void _applyFilters(Map<String,bool> filterData){
      print(filterData);
      setState(() {
        _filters=filterData;
        _availableMeals=_availableMeals.where((meal){
          if(_filters['gluten'] && !meal.isGlutenFree)
          {
            return false;
          }
          if(_filters['lactose'] && !meal.isLactoseFree)
          {
            return false;
          }
          if(_filters['vegan'] && !meal.isVegan)
          {
            return false;
          }
          if(_filters['vegetarian'] && !meal.isVegetarian)
          {
            return false;
          }
          return true;
        }).toList();
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.white70,
        canvasColor: Color.fromRGBO(255, 254, 229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes:{
        '/':(ctx)=>TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName:(ctx){
          return CategoryMealsScreen(_availableMeals); 
        },
        MealDetailsScreen.routeName:(ctx){
          return MealDetailsScreen(_toggleFavorite,_isMealFavorite);
        },
        FilterScreen.routeName:(ctx){
          return FilterScreen(_filters,_applyFilters);
        }
      },
      onGenerateRoute: (setting){
           print(setting.arguments);
         //  return MaterialPageRoute(builder: (context)=>CategoriesScreen());
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder:(context)=>CategoriesScreen());
      },
    );
  }
}

