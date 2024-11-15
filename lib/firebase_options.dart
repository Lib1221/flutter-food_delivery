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
<<<<<<< HEAD
    apiKey: 'AIzaSyCRBiw2qy0zxPr3B7JsXewBYhjvg0NIm4I',
    appId: '1:245496442140:web:131c089a557271cb0a1ed9',
    messagingSenderId: '245496442140',
    projectId: 'mesobexpress-49e5d',
    authDomain: 'mesobexpress-49e5d.firebaseapp.com',
    storageBucket: 'mesobexpress-49e5d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7R6ZH-ZZ88R_cpUwYj12yykEWJB0pmUI',
    appId: '1:245496442140:android:381b19ab4639c3ae0a1ed9',
    messagingSenderId: '245496442140',
    projectId: 'mesobexpress-49e5d',
    storageBucket: 'mesobexpress-49e5d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg7_rWQyc9U_teK0CC_rltVxxJY4Vuu7Y',
    appId: '1:245496442140:ios:bc18e84ae52f7f2c0a1ed9',
    messagingSenderId: '245496442140',
    projectId: 'mesobexpress-49e5d',
    storageBucket: 'mesobexpress-49e5d.firebasestorage.app',
    iosClientId: '245496442140-dj6ugdtgo9oci6mgr1bnk1307prd5a3s.apps.googleusercontent.com',
    iosBundleId: 'com.example.check',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCg7_rWQyc9U_teK0CC_rltVxxJY4Vuu7Y',
    appId: '1:245496442140:ios:bc18e84ae52f7f2c0a1ed9',
    messagingSenderId: '245496442140',
    projectId: 'mesobexpress-49e5d',
    storageBucket: 'mesobexpress-49e5d.firebasestorage.app',
    iosClientId: '245496442140-dj6ugdtgo9oci6mgr1bnk1307prd5a3s.apps.googleusercontent.com',
    iosBundleId: 'com.example.check',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCRBiw2qy0zxPr3B7JsXewBYhjvg0NIm4I',
    appId: '1:245496442140:web:870070023e4d02380a1ed9',
    messagingSenderId: '245496442140',
    projectId: 'mesobexpress-49e5d',
    authDomain: 'mesobexpress-49e5d.firebaseapp.com',
    storageBucket: 'mesobexpress-49e5d.firebasestorage.app',
=======
    apiKey: 'AIzaSyDUZA0TSh8ejZvu6Ylh11h-_ssnytpPO9c',
    appId: '1:206859963118:web:20f420a970c31f7c4b41ff',
    messagingSenderId: '206859963118',
    projectId: 'just-something-2c761',
    authDomain: 'just-something-2c761.firebaseapp.com',
    storageBucket: 'just-something-2c761.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUBk5RL8_S-e44541DLjcF5YDBkwcqKec',
    appId: '1:206859963118:android:21f6ccce093584134b41ff',
    messagingSenderId: '206859963118',
    projectId: 'just-something-2c761',
    storageBucket: 'just-something-2c761.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlo79k6v5r-ciYGfik-XdXnvzByKlCHz4',
    appId: '1:206859963118:ios:0e2f9a1cb89edb404b41ff',
    messagingSenderId: '206859963118',
    projectId: 'just-something-2c761',
    storageBucket: 'just-something-2c761.appspot.com',
    iosClientId: '206859963118-0fid2pa8tru0g6hpj1mm9h8p85ekmam1.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivry',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlo79k6v5r-ciYGfik-XdXnvzByKlCHz4',
    appId: '1:206859963118:ios:0e2f9a1cb89edb404b41ff',
    messagingSenderId: '206859963118',
    projectId: 'just-something-2c761',
    storageBucket: 'just-something-2c761.appspot.com',
    iosClientId: '206859963118-0fid2pa8tru0g6hpj1mm9h8p85ekmam1.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivry',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUZA0TSh8ejZvu6Ylh11h-_ssnytpPO9c',
    appId: '1:206859963118:web:9ecee615c0cb97aa4b41ff',
    messagingSenderId: '206859963118',
    projectId: 'just-something-2c761',
    authDomain: 'just-something-2c761.firebaseapp.com',
    storageBucket: 'just-something-2c761.appspot.com',
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
  );

}