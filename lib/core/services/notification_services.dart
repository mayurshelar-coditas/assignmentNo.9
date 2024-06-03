import 'dart:math';

import 'package:assignment9/core/message_screen.dart';
import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //The request are permanent that mean if the user rejects the request then he will have to manually edit the permissions.
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true, //only this show the notification on the phone
      announcement: true,
      badge: true, //shows indicator like 1,2,3,4.
      carPlay: true,
      criticalAlert: true,
      sound: true,
      provisional: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Provisional permission granted');
    } else {
      print('Permission not granted');
    }
  }

  //Firebase tokens - and these tokens can expire too.
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();

    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  //To show notification when app is in one the states below:
  //  in background
  //  in foreground
  //  killed/terminated

  //Function to initialize flutter local notifications
  //Here remote messages are the messages we recieve from the firebase
  void initLocalNotifications(
      BuildContext context, RemoteMessage remoteMessage) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, remoteMessage);
      },
    );
  }

  //1. To show notifications when app is running in foreground
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data['page']);
      }

      initLocalNotifications(context, message);
      showNotifications(message);
    });
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      "High Importance Notifications",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Your Channel description",
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        1,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  //Background
  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['page'] == '1') {
      print('data is Settings');  

      
      
    }
  }
}
