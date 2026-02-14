import 'package:flutter/material.dart';

class MealSelectionScreen extends StatefulWidget {
  @override
  _MealSelectionScreenState createState() => _MealSelectionScreenState();
}

class _MealSelectionScreenState extends State<MealSelectionScreen> with SingleTickerProviderStateMixin {
  bool isLunchSelected = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Animation setup
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  void _toggleMealSelection() {
    setState(() {
      isLunchSelected = !isLunchSelected;
      isLunchSelected ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Column(
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(8.0),
                      selectedColor: Colors.white,
                      fillColor: Colors.blue,
                      children: [Text('Lunch'), Text('Dinner')],
                      isSelected: [isLunchSelected, !isLunchSelected],
                      onPressed: (index) {
                        _toggleMealSelection();
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Deadline for meal selection: ${DateTime.utc(2026, 2, 14, 12, 0, 0).toLocal()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You can cancel your order up to 1 hour before the meal time.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle meal selection submission
              },
              child: Text('Submit Selection'),
            ),
          ],
        ),
      ),
    );
  }
}