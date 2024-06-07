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
    apiKey: 'AIzaSyDxkYhzI7noAlCa0Go-cPynNZTrFWHrx2w',
    appId: '1:974591293146:web:620b0a1182fd5d518b97e3',
    messagingSenderId: '974591293146',
    projectId: 'whatsapp-new-design',
    authDomain: 'whatsapp-new-design.firebaseapp.com',
    storageBucket: 'whatsapp-new-design.appspot.com',
    measurementId: 'G-JM7QBJH3L4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8Oi8kraxhkQOdlqnI7uz-hSmuZKL865I',
    appId: '1:974591293146:android:3eed93cafaa08e0d8b97e3',
    messagingSenderId: '974591293146',
    projectId: 'whatsapp-new-design',
    storageBucket: 'whatsapp-new-design.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY0h6-KAyOvB5hfmopnPVyDqdqViadOlU',
    appId: '1:974591293146:ios:cc0cbc71655a13618b97e3',
    messagingSenderId: '974591293146',
    projectId: 'whatsapp-new-design',
    storageBucket: 'whatsapp-new-design.appspot.com',
    iosBundleId: 'com.example.whatsappNewDesign',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDY0h6-KAyOvB5hfmopnPVyDqdqViadOlU',
    appId: '1:974591293146:ios:cc0cbc71655a13618b97e3',
    messagingSenderId: '974591293146',
    projectId: 'whatsapp-new-design',
    storageBucket: 'whatsapp-new-design.appspot.com',
    iosBundleId: 'com.example.whatsappNewDesign',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxkYhzI7noAlCa0Go-cPynNZTrFWHrx2w',
    appId: '1:974591293146:web:87d1a091222257288b97e3',
    messagingSenderId: '974591293146',
    projectId: 'whatsapp-new-design',
    authDomain: 'whatsapp-new-design.firebaseapp.com',
    storageBucket: 'whatsapp-new-design.appspot.com',
    measurementId: 'G-1JZCJL1G92',
  );

}