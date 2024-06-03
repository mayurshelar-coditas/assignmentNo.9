// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
//To show notification when app is in foreground
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'high Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );

  //This methods needs to be a top-level message
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Title: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future<void> initNotifications() async {
    // This below line of code is for requesting messaging from the user for ios its a dialog and for android it wiil return a value indicating wheter the permission is enable or disabled by the os.
    await _firebaseMessaging.requestPermission();

    //Now we will get the Firebase Cloud messaging token which is used as an identifier in our app
    //Which will used for sending notifications to the specific device.
    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);

    initPushNotifications(flutterLocalNotificationsPlugin);
  }

  Future<void> initPushNotifications(
      FlutterLocalNotificationsPlugin instance) async {
    //When you are on ios and app is on foreground then it is imp to call the following otherwise it wont show.
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //This is required when the app is opened from the terminated state using notification
    //Because we want to handle the message using the method we passed to the then()
    _firebaseMessaging.getInitialMessage().then(handleMessage);

    //This is same as above but for when the app is running in background.
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    //And finally we add our background handler, //The following will allow us to recieve the notifications in background
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/ic_notification')),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotifications() async {
    //Firstly we will initialize our android settings
    AndroidInitializationSettings androidInitialize =
        const AndroidInitializationSettings('ic_notification');
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitialize);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveNotificationResponse: (payload) {
    //   final message = RemoteMessage.fromMap(
    //     jsonDecode(
    //       payload.toString(),
    //     );

      // );
    // });
  }
}

