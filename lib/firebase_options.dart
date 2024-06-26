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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDJSFA9hlWjnJpD8nq9TjcR3-sifIILrD8',
    appId: '1:750302150862:web:e72c0bf9171d316942909f',
    messagingSenderId: '750302150862',
    projectId: 'wordquest-683d1',
    authDomain: 'wordquest-683d1.firebaseapp.com',
    storageBucket: 'wordquest-683d1.appspot.com',
    measurementId: 'G-RCJNR6W558',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvE5-pSc4GhH5gTQ-WtofIUp6-lp38Jng',
    appId: '1:750302150862:android:15c610c35dfb242a42909f',
    messagingSenderId: '750302150862',
    projectId: 'wordquest-683d1',
    storageBucket: 'wordquest-683d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_4kp-Mv3cdKoakWL8ai_Sl45zqGxcATw',
    appId: '1:750302150862:ios:e16029d17c894b0542909f',
    messagingSenderId: '750302150862',
    projectId: 'wordquest-683d1',
    storageBucket: 'wordquest-683d1.appspot.com',
    iosBundleId: 'com.example.wordquest',
  );
}
