// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAmqgM-Z2-4XHyA4apy2VqShoqbBE6K3rY',
    appId: '1:974039335638:web:6dc8e05bea34d659e57f77',
    messagingSenderId: '974039335638',
    projectId: 'test-dd24d',
    authDomain: 'test-dd24d.firebaseapp.com',
    storageBucket: 'test-dd24d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF4iok5dFlp7gbWFuNTx56UUo1hsxuFNY',
    appId: '1:974039335638:android:bcded225d2c1bc3be57f77',
    messagingSenderId: '974039335638',
    projectId: 'test-dd24d',
    storageBucket: 'test-dd24d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxQFMRdzxcfBmwcpEVxg9BxszZC3NdCgQ',
    appId: '1:974039335638:ios:55ed6198abe87167e57f77',
    messagingSenderId: '974039335638',
    projectId: 'test-dd24d',
    storageBucket: 'test-dd24d.appspot.com',
    androidClientId: '974039335638-jp37qtk46rjitf6hlcn899i6ebhfibac.apps.googleusercontent.com',
    iosClientId: '974039335638-qlkseij6qkushnlj0mlkuegt2ju0hsdn.apps.googleusercontent.com',
    iosBundleId: 'io.firebase.test',
  );
}
