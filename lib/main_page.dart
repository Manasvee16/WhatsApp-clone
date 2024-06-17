import 'package:flutter/material.dart';
import 'package:whatsapp_new_design/features/calls_screen.dart';
import 'package:whatsapp_new_design/features/communities_screen.dart';
import 'package:whatsapp_new_design/features/home_screen.dart';
import 'package:whatsapp_new_design/features/updates_screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int _selectedIndex=0;
  final List<Widget> _pages=[
    //screen1
    HomeScreen(),
    //screen2
    UpdatesScreen(),
    //screen3
    CommunitiesScreen(),
    //screen4
    CallsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex=index;
    }
    );
  }
  Widget buildNavBarItem(IconData filledIcon, IconData outlinedIcon, String text, int index) {
    return GestureDetector(
      onTap: ()=> _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                color: _selectedIndex==index?Color(0xFFD8FDD2):Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _selectedIndex==index?filledIcon:outlinedIcon,
                size: 28,
                color: _selectedIndex==index?Color(0xFF125E3A):Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: _selectedIndex==index?FontWeight.w900:FontWeight.w500,
              color: Colors.black,
            ),
            ),
          ],
        ),
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black12, width: 0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: buildNavBarItem(Icons.message, Icons.message_outlined, "Chats", 0)),
          Expanded(child: buildNavBarItem(Icons.update, Icons.update_outlined, "Updates", 1)),
          Expanded(child: buildNavBarItem(Icons.people, Icons.people_outline, "Communities", 2)),
          Expanded(child: buildNavBarItem(Icons.call, Icons.call_outlined, "Calls", 3)),
        ],
      ),
    ),
    );
  }
}