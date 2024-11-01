// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA0qgzEVA9pF50a0_bw1Z4TZCcnUhRA-1A',
    appId: '1:630257936718:web:35af56836f8bbe11f9d61f',
    messagingSenderId: '630257936718',
    projectId: 'hackathon-d0297',
    authDomain: 'hackathon-d0297.firebaseapp.com',
    storageBucket: 'hackathon-d0297.appspot.com',
    measurementId: 'G-ZY08MQC6P5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJEOSW1kfjb25dQEWlvhceECHhebfS2pE',
    appId: '1:630257936718:android:b4b9253b287dad3af9d61f',
    messagingSenderId: '630257936718',
    projectId: 'hackathon-d0297',
    storageBucket: 'hackathon-d0297.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAymw8mBCzexcD2hK5WjV14Qi9XoNZP6u8',
    appId: '1:630257936718:ios:5b9fc983002a2f66f9d61f',
    messagingSenderId: '630257936718',
    projectId: 'hackathon-d0297',
    storageBucket: 'hackathon-d0297.appspot.com',
    iosClientId: '630257936718-sgvlqic4hni1idsrboehv4b6eu0idhce.apps.googleusercontent.com',
    iosBundleId: 'com.example.dashboardV1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAymw8mBCzexcD2hK5WjV14Qi9XoNZP6u8',
    appId: '1:630257936718:ios:6f5673cfc4b5034df9d61f',
    messagingSenderId: '630257936718',
    projectId: 'hackathon-d0297',
    storageBucket: 'hackathon-d0297.appspot.com',
    iosClientId: '630257936718-gi7qgb0obqmquf4opligdhavluj97jts.apps.googleusercontent.com',
    iosBundleId: 'com.example.dashboardV1.RunnerTests',
  );
}
