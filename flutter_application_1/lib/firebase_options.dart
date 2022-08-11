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
    apiKey: 'AIzaSyCISlJHgb9Py1WSNd_eVX1wsboaqYwkVck',
    appId: '1:766357741091:web:8e4a9aa87fd278eddc5b96',
    messagingSenderId: '766357741091',
    projectId: 'third-year-project-24c8e',
    authDomain: 'third-year-project-24c8e.firebaseapp.com',
    storageBucket: 'third-year-project-24c8e.appspot.com',
    measurementId: 'G-5MNVXEPWDB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3kyA2ZIJfK53rLzrhTbO05M-wXJI6s_A',
    appId: '1:766357741091:android:767af9d4b16d398adc5b96',
    messagingSenderId: '766357741091',
    projectId: 'third-year-project-24c8e',
    storageBucket: 'third-year-project-24c8e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAioj_iFmdLtEolUaPAM5dXmdZqtWZUa3E',
    appId: '1:766357741091:ios:83e79505ff2127d2dc5b96',
    messagingSenderId: '766357741091',
    projectId: 'third-year-project-24c8e',
    storageBucket: 'third-year-project-24c8e.appspot.com',
    iosClientId: '766357741091-74p1oun55gko2hmkvet4df6nnjgsncog.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAioj_iFmdLtEolUaPAM5dXmdZqtWZUa3E',
    appId: '1:766357741091:ios:83e79505ff2127d2dc5b96',
    messagingSenderId: '766357741091',
    projectId: 'third-year-project-24c8e',
    storageBucket: 'third-year-project-24c8e.appspot.com',
    iosClientId: '766357741091-74p1oun55gko2hmkvet4df6nnjgsncog.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
