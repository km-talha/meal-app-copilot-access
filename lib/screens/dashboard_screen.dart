import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Dashboard'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Real-time Meal Counts', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text('Lunch: 3', style: TextStyle(fontSize: 18)),
                  Text('Dinner: 5', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu),
                label: 'Meals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: 0,
            onTap: (index) {
              // Handle navigation
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for quick meal
                  },
                  child: Text('Quick Meal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for meal prep
                  },
                  child: Text('Meal Prep'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}