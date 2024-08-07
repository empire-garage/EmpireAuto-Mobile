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
    apiKey: 'AIzaSyAPtftCfGOJfkIlRcoQ4QoJTwP1xXuBlm8',
    appId: '1:120247352484:web:6056f555a281a37a80fa31',
    messagingSenderId: '120247352484',
    projectId: 'empirefirebase',
    authDomain: 'empirefirebase.firebaseapp.com',
    databaseURL: 'https://empirefirebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'empirefirebase.appspot.com',
    measurementId: 'G-H53JPEDXQL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSogN-07rkrgPkR8esgxDrr6FoX1u2X18',
    appId: '1:120247352484:android:ec12f135e1ecbff080fa31',
    messagingSenderId: '120247352484',
    projectId: 'empirefirebase',
    databaseURL: 'https://empirefirebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'empirefirebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAl9OfcgjrjUDDLtKRlolYOv-TsvVnKA4',
    appId: '1:120247352484:ios:ddbd0496324bbdd080fa31',
    messagingSenderId: '120247352484',
    projectId: 'empirefirebase',
    databaseURL: 'https://empirefirebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'empirefirebase.appspot.com',
    androidClientId: '120247352484-2fn6l8d9cd6p515fses2uqsmomm5iekq.apps.googleusercontent.com',
    iosClientId: '120247352484-e9im42igmviq089i0s51p4pkkak2bjnn.apps.googleusercontent.com',
    iosBundleId: 'com.example.empiregarageMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAl9OfcgjrjUDDLtKRlolYOv-TsvVnKA4',
    appId: '1:120247352484:ios:ddbd0496324bbdd080fa31',
    messagingSenderId: '120247352484',
    projectId: 'empirefirebase',
    databaseURL: 'https://empirefirebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'empirefirebase.appspot.com',
    androidClientId: '120247352484-2fn6l8d9cd6p515fses2uqsmomm5iekq.apps.googleusercontent.com',
    iosClientId: '120247352484-e9im42igmviq089i0s51p4pkkak2bjnn.apps.googleusercontent.com',
    iosBundleId: 'com.example.empiregarageMobile',
  );
}
