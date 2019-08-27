import "package:flutter/material.dart";
import '../widgets/main_drawer.dart';
class FilterScreen extends StatefulWidget{
  static const routeName="/filters";
  final Function applyFilter;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.applyFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegan=false;
  bool _vegetarian=false;
   @override
  void initState() {
    // TODO: implement initState
    print(widget.currentFilters);
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title:Text('Filters'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.save),onPressed: (){
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian
            };
            widget.applyFilter(selectedFilters);},)
        ],
       ),
       drawer: MainDrawer(),
       body: Column(children: <Widget>[
         Container(padding:EdgeInsets.all(20),
         child:Text("Adjust Your Meal Selection",style: Theme.of(context).textTheme.title,)),
         Expanded(child: ListView(
                children:[
                SwitchListTile(title: Text("Gluton Free"),value: _glutenFree,
                subtitle: Text('Only Include gluten-free meals'), onChanged: (bool value) {
                  setState((){
                    _glutenFree=value;
                  });
                },
                ),
                SwitchListTile(title: Text("Lactose Free"),value: _lactoseFree,
                subtitle: Text('Only Include lactose-free meals'), onChanged: (bool value) {
                  setState((){
                    _lactoseFree=value;
                  });
                },
                ),SwitchListTile(title: Text("Vegan"),value: _vegan,
                subtitle: Text('Only Include meals for vegan'), onChanged: (bool value) {
                  setState((){
                    _vegan=value;
                  });
                },
                ),SwitchListTile(title: Text("Vegetarian"),value: _vegetarian,
                subtitle: Text('Only Include vegetarian meals'), onChanged: (bool value) {
                  setState((){
                    _vegetarian=value;
                  });
                },
                )
                ]
         ),)
       ],)
       ,);
  }
}