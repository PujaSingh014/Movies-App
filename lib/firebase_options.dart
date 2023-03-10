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
    apiKey: 'AIzaSyDAViQrMp05erKUtsg9Yfau0kvhNehmZeA',
    appId: '1:61001048103:web:d99a9b0f63ea9cf9aa2e02',
    messagingSenderId: '61001048103',
    projectId: 'movies-app-dd750',
    authDomain: 'movies-app-dd750.firebaseapp.com',
    storageBucket: 'movies-app-dd750.appspot.com',
    measurementId: 'G-PFVP96EWNP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkK_Z00h46KmAjivluqrZnWbO-C3ktGgQ',
    appId: '1:61001048103:android:5bb9aed4f494bab8aa2e02',
    messagingSenderId: '61001048103',
    projectId: 'movies-app-dd750',
    storageBucket: 'movies-app-dd750.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1TuV68Zh3qs-3DYTbmvXrDUFXY_SE9MA',
    appId: '1:61001048103:ios:2251202594e69b52aa2e02',
    messagingSenderId: '61001048103',
    projectId: 'movies-app-dd750',
    storageBucket: 'movies-app-dd750.appspot.com',
    iosClientId: '61001048103-ikapd5p372n6di5i2vq14f45cajemihl.apps.googleusercontent.com',
    iosBundleId: 'com.example.moviesApp',
  );
}
