import 'package:first_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

bool _glutenFree = false ; 
bool _vegeratian = false  ; 
bool _vegan = false; 
bool _lactoseFree =  false ; 

Widget _buildSwitchListTile(String title , String description  , bool currentValue  , Function update){





}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Favorits'),),
      drawer: MainDrawer(),
      body: Column(
    children: <Widget>[
Container(padding: EdgeInsets.all(20),child: Text('Adjust Your Selection',
style: Theme.of(context).textTheme.title,
),


),
Expanded(child: ListView(

children: <Widget>[
SwitchListTile(title: Text("Gluten-free"),value: _glutenFree,

subtitle: Text("Only Included"),
onChanged:(newvalue){
setState(() {
  _glutenFree = newvalue ; 
});


} ,)

],

))

    ],
      ),
      
    );
  }
}

