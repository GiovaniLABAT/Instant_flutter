import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBSqtuvt0in4ysnvzm26j-M3Qy5cbsEOl8",
            authDomain: "mars-project-a4037.firebaseapp.com",
            projectId: "mars-project-a4037",
            storageBucket: "mars-project-a4037.appspot.com",
            messagingSenderId: "943911181329",
            appId: "1:943911181329:web:413c1cfc79c503d0cde5b0"));
  } else {
    await Firebase.initializeApp();
  }
}
