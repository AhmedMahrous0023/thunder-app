import 'package:flutter/material.dart';
import 'package:thunder_app/Views/Screens/home_screen.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _selectedIndex = 2; final List<Widget> _screens = [
       const  Center(child: Text('Home Screen')),
   const  Center(child: Text('Portfolio Screen')),
   const HomeScreen(),
   const  Center(child: Text('Feed Screen')),
   const  Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
       
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
      elevation: 0,fixedColor: Colors.black,
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined),label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.feed_rounded),label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body:_screens[_selectedIndex],
     
    );
  }
}
