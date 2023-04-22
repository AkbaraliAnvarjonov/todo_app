import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_app/data/models/task_model.dart';

class LocalNotificationService {
  static final LocalNotificationService localNotificationService =
      LocalNotificationService._();

  factory LocalNotificationService() {
    return localNotificationService;
  }

  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() {
    // Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("app_icon");

    //IOS
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    //Set
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) {
        //Android
        if (notificationResponse.payload != null) {
          debugPrint('PAYLOAD RESULT------> ${notificationResponse.payload}');
        } else {
          print("PAYLOAD RESULT NULL");
        }
      },
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    tz.initializeTimeZones();
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    print("TAPPED FROM BACKGROUND");
  }

// Android

  //IOS
  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {}

  //channel
  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel(
    "my_channel",
    "Notification Lesson ",
    importance: Importance.max,
    description: "My Notification description",
  );

  void showNotification(
      {required int id, required title, String subtitle = ""}) {
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      subtitle,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          priority: Priority.max,
          playSound: true,
          icon: "app_icon",
          showProgress: true,
          largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
        ),
      ),
      payload: "SIMPLE NOTIFICATION DATA ID:$id",
    );
  }

  void scheduleNotification(
      {required TaskModel task, required int time}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id,
      "Task!",
      task.title,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: time)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'To remind you about upcoming tasks',
        ),
      ),
      payload: "SCHEDULED NOTIFICATION PAYLOAD DATA ID:${task.id}",
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    print("done-------------------------------------------");
  }

  // void showPeriodically({required int id}) async {
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     id,
  //     'Peridically',
  //     'Body. ID: $id',
  //     RepeatInterval.everyMinute,
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         androidNotificationChannel.id,
  //         androidNotificationChannel.name,
  //         channelDescription: 'To remind you about upcoming birthdays',
  //       ),
  //     ),
  //     androidAllowWhileIdle: true,
  //     payload: "PERIODICALLY NOTIFICACYION DATA ID:$id",
  //   );
  // }

  void cancelAllNotifications() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  void cancelNotificationById(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
