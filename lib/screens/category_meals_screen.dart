 import 'package:flutter/material.dart';
  import '../dommy_data.dart';
  import '../widgets/meal_item.dart';

 class CategoryMealsScreen extends StatelessWidget {
static const routeName =  '/categories-meals';


   @override
   Widget build(BuildContext context) {
   final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
  final routeArgs = route.settings.arguments as Map<String ,String>;
final categoryTitle = routeArgs['title'];
final cateogrtyId =  routeArgs['id'];
final categoryMeals = DUMMY_MEALS.where((meal)  {
return meal.categories.contains(cateogrtyId);
}).toList();
 return Scaffold(
appBar: AppBar(
title: Text(categoryTitle ?? ""),
),
body: ListView.builder(itemBuilder: (ctx , index){
return MealItem(  categoryMeals[index].title , 
categoryMeals[index].imageUrl ,
categoryMeals[index].duration,
categoryMeals[index].complexity,
categoryMeals[index].affordability,
);
} , itemCount: categoryMeals.length,)  ,
     );
   }
 }