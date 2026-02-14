import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationProvider(this._flutterLocalNotificationsPlugin);

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = 
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleDailyNotifications() async {
    var scheduledNotificationTime = Time(9, 0, 0);
    await _scheduleDailyNotification(scheduledNotificationTime);

    scheduledNotificationTime = Time(9, 30, 0);
    await _scheduleDailyNotification(scheduledNotificationTime);

    scheduledNotificationTime = Time(9, 50, 0);
    await _scheduleDailyNotification(scheduledNotificationTime);

    scheduledNotificationTime = Time(16, 50, 0);
    await _scheduleDailyNotification(scheduledNotificationTime);
  }

  Future<void> _scheduleDailyNotification(Time time) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,  // Notification ID
      'Meal Reminder',
      'Time to check your meal plan!',
      // Specify the schedule here
      
      // This is where you handle the time zone properly.
      
      // Assuming UTC; customize it if needed
      // This should be handled as per your requirements.
      
      // Implement your logic to get `tz.TZDateTime` according to your preference. 
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 1)), // Placeholder
      
      // Adjust the below line for repeat notifications if necessary.
      
      // For daily notification.
      
      const NotificationDetails(android: AndroidNotificationDetails('daily_channel_id', 'Daily Notifications')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);
  }
}