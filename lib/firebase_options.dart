// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1Pl3hNgC4arTT6ztD9gl6-8v0FdT_unU',
    appId: '1:977154933011:web:207d1b436533d596eddae6',
    messagingSenderId: '977154933011',
    projectId: 'assignment10-b63a2',
    authDomain: 'assignment10-b63a2.firebaseapp.com',
    storageBucket: 'assignment10-b63a2.appspot.com',
    measurementId: 'G-RYQKXYWPRP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDf6ONIhZ6VocL_yUrUwktegCal3c75awE',
    appId: '1:977154933011:android:46b5183c36147593eddae6',
    messagingSenderId: '977154933011',
    projectId: 'assignment10-b63a2',
    storageBucket: 'assignment10-b63a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATi6q3VRJG_apaebXlUVBX7ZZiVBNy-_w',
    appId: '1:977154933011:ios:df5916490f258468eddae6',
    messagingSenderId: '977154933011',
    projectId: 'assignment10-b63a2',
    storageBucket: 'assignment10-b63a2.appspot.com',
    iosBundleId: 'com.example.assignment9',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATi6q3VRJG_apaebXlUVBX7ZZiVBNy-_w',
    appId: '1:977154933011:ios:df5916490f258468eddae6',
    messagingSenderId: '977154933011',
    projectId: 'assignment10-b63a2',
    storageBucket: 'assignment10-b63a2.appspot.com',
    iosBundleId: 'com.example.assignment9',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1Pl3hNgC4arTT6ztD9gl6-8v0FdT_unU',
    appId: '1:977154933011:web:8acf9238b8a802a2eddae6',
    messagingSenderId: '977154933011',
    projectId: 'assignment10-b63a2',
    authDomain: 'assignment10-b63a2.firebaseapp.com',
    storageBucket: 'assignment10-b63a2.appspot.com',
    measurementId: 'G-1JQM6WHB4R',
  );

}