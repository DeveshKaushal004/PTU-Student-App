import 'package:flutter/material.dart';
import 'package:sih/ProfilePage.dart';
import 'SettingsPage.dart';
import 'ProfilePage.dart';
import 'ExplorePage.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Hostel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => FirstPage(),
        '/settings': (context) => SettingsPage(),
        '/Profile':(context) => ProfilePage(),
        '/Explore':(context) =>ExplorePage(),
      },
    );
  }
}
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
{
  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String searchQuery = _searchController.text;
                    //Implement your search functionality here
                    print('Searching for: $searchQuery');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore), // Replace Icons.search with Icons.explore
            label: 'Explore', // Change the label to 'Explore'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 4) {
            // Navigate to the Settings page
            Navigator.pushNamed(context, '/settings');
          } else if (index == 3) {
            // Navigate to the Profile page
            Navigator.pushNamed(context, '/Profile');
          }
          else if (index == 1) {
            // Navigate to the explore page
            Navigator.pushNamed(context, '/Explore');
          }
          else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}