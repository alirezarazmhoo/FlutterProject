import 'package:flutter/material.dart';
import './favortis_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pages = [
    {'page':CategoriesScreen() , 'title' : 'Categories'}, 
    {'page':FavoritScreen() , 'title' : 'Favorits'} ];

  int _selectedPageIndex = 0;

  void _selectPage(int Index) {
    setState(() {
      _selectedPageIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
currentIndex: _selectedPageIndex,
type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorits'))
        ],
      ),
    );
  }
}
