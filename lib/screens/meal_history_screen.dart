import 'package:flutter/material.dart';

class MealHistoryScreen extends StatefulWidget {
  @override
  _MealHistoryScreenState createState() => _MealHistoryScreenState();
}

class _MealHistoryScreenState extends State<MealHistoryScreen> {
  DateTime selectedDate = DateTime.now();
  String viewFilter = 'daily'; // Can be 'daily' or 'monthly'

  // Mock data for meal history
  List<Map<String, dynamic>> mealHistory = [];

  @override
  void initState() {
    super.initState();
    // Load meal history data (mock data for now)
    loadMealHistory();
  }

  void loadMealHistory() {
    // Load or generate meal history data
    // For simplicity, adding dummy data
    mealHistory = List.generate(30, (index) {
      return {
        'date': DateTime.now().subtract(Duration(days: index)),
        'mealsCount': (index % 5) + 1,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal History'),
        actions: [
          DropdownButton<String>(
            value: viewFilter,
            items: <String>['daily', 'monthly']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
            .toList(),
            onChanged: (String? newValue) {
              setState(() {
                viewFilter = newValue!;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selected Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mealHistory.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: ListTile(
                    title: Text('${mealHistory[index]['date'].toLocal().toString().split(' ')[0]}'),
                    subtitle: Text('Meals Count: ${mealHistory[index]['mealsCount']}'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action to show calendar view or filter options
              },
              child: Text('Show Calendar View'),
            ),
          ),
        ],
      ),
    );
  }
}