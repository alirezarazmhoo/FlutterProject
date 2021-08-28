 import 'package:flutter/material.dart';
  import '../dommy_data.dart';
  import '../widgets/meal_item.dart';
import '../models/meals.dart';
 class CategoryMealsScreen  extends StatefulWidget {
static const routeName =  '/categories-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categoryTitle = "" ; 
List<Meal> displayedMeal = List.empty();
var _loadedInitialData = false ; 
@override
  void initState() {

    super.initState();
  }

void _removeMeal(String mealId){

setState(() {
  displayedMeal.removeWhere((meal) => meal.id == mealId);
});

}

@override
  void didChangeDependencies() {
    if(!_loadedInitialData){

final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String ,String>;
final categoryTitle = routeArgs['title'];
final cateogrtyId =  routeArgs['id'];
final displayedMeal = DUMMY_MEALS.where((meal)  {
return meal.categories.contains(cateogrtyId);
}).toList();
_loadedInitialData = true ; 
    }
    super.didChangeDependencies();
  }



   @override
 Widget build(BuildContext context) {

 return Scaffold(
appBar: AppBar(
title: Text(categoryTitle ?? ""),
),
body: ListView.builder(itemBuilder: (ctx , index){
return MealItem(  displayedMeal[index].title , 
displayedMeal[index].imageUrl ,
displayedMeal[index].duration,
displayedMeal[index].complexity,
displayedMeal[index].affordability,
displayedMeal[index].id , 
_removeMeal  

);
} , itemCount: displayedMeal.length,)  ,
     );
   }
}