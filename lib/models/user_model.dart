class User {
  String id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});
}

class Student extends User {
  String studentId;

  Student({required String id, required String name, required String email, required this.studentId}) 
    : super(id: id, name: name, email: email);
}

class Hall {
  String hallId;
  String hallName;

  Hall({required this.hallId, required this.hallName});
}

class MealSelection {
  String mealId;
  String mealName;
  DateTime date;

  MealSelection({required this.mealId, required this.mealName, required this.date});
}

class GuestMeal {
  String guestId;
  String mealId;

  GuestMeal({required this.guestId, required this.mealId});
}

class DailySummary {
  DateTime date;
  int totalMeals;

  DailySummary({required this.date, required this.totalMeals});
}

class Logs {
  String logId;
  DateTime timestamp;
  String message;

  Logs({required this.logId, required this.timestamp, required this.message});
}

class Notification {
  String notificationId;
  String message;
  bool isRead;

  Notification({required this.notificationId, required this.message, this.isRead = false});
}