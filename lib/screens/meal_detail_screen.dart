import 'package:flutter/material.dart';
import "../dummy_data.dart";

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal_detail";
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailsScreen(this.toggleFavorite,this.isMealFavorite); 
  Widget buildContainer(Widget child){
    return   Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                width: 300,
                height: 150,
                child:child);
  }

  Widget buildItem(BuildContext context,Widget child){
    return Card(
                    color: Theme.of(context).accentColor,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                         child:child
                  ));
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    print(isMealFavorite(mealId));
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'ingredients',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            
                  buildContainer(ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) => buildItem(context, 
                  Text(selectedMeal.ingredients[index])),),
                  ),
                  buildContainer(ListView.builder(
                    itemCount:selectedMeal.steps.length,
                    itemBuilder: (context,index)=>Column(
                      children: <Widget>[
                        ListTile(
                          title:Text(selectedMeal.steps[index]),
                          leading: CircleAvatar(child:Text('# ${index+1}')),
                        ),
                        Divider()
                      ],
                    )) ,
                  )
    ],
          ),
        ),floatingActionButton: FloatingActionButton(onPressed: (){
          toggleFavorite(mealId);
        },
        child:Icon(isMealFavorite(mealId)?Icons.favorite:Icons.favorite_border,color: Colors.red,)
        ),);
  }
}
