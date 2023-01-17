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
    apiKey: 'AIzaSyD7k8TVtqZ6DMpY43xbfDrQVpI-Oypi_hI',
    appId: '1:841973188601:web:a013d8569e8f7aee6b5f28',
    messagingSenderId: '841973188601',
    projectId: 'flutter-movie-quotes-3dd45',
    authDomain: 'flutter-movie-quotes-3dd45.firebaseapp.com',
    storageBucket: 'flutter-movie-quotes-3dd45.appspot.com',
    measurementId: 'G-76Q64QVGYK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8Fbp8vcODnsuKfWZ0rzuL0puBoBiijYk',
    appId: '1:841973188601:android:aec2af2b3f1b39836b5f28',
    messagingSenderId: '841973188601',
    projectId: 'flutter-movie-quotes-3dd45',
    storageBucket: 'flutter-movie-quotes-3dd45.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBykvmvrV75v3kBuNz0LepUpVQdS7Gn44',
    appId: '1:841973188601:ios:8a5cee87dac9459d6b5f28',
    messagingSenderId: '841973188601',
    projectId: 'flutter-movie-quotes-3dd45',
    storageBucket: 'flutter-movie-quotes-3dd45.appspot.com',
    iosClientId: '841973188601-1tihq8pigp0k2oub820rcs1onij1s0a1.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieQuotesFlutter',
  );
}
