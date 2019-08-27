import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget{
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() {
    // TODO: implement createState
    return _TabsScreenState();
  }
  
}
class _TabsScreenState extends State<TabsScreen>{
  
  List<Map<String,dynamic>> _pages;
  int _selectedPageIndex=0;
  @override
  void initState() {
      print("inside init state");
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index)
  {
     setState(() {
       _selectedPageIndex=index;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(_pages);
    return  Scaffold(
      appBar:AppBar(title: Text(_pages[_selectedPageIndex]['title']),),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.category),title: Text('Categories')),
          BottomNavigationBarItem(icon:Icon(Icons.favorite),title:Text('favorite'))
        ]
      ),body:_pages[_selectedPageIndex]['page']);
  }
  
}


/*
bottom: TabBar(tabs: <Widget>[
        Tab(icon:Icon(Icons.category),text:'categories'),
        Tab(icon:Icon(Icons.favorite),text: 'favourites',)
      ],),),
    body:TabBarView(children: <Widget>[
      CategoriesScreen(),
      FavoritesScreen()
    ],)
    )
     */