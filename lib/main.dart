import 'package:firebase_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/services/service_locator.dart' as di;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //inizializzo Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //inizializzo il service locator
  await di.init();
  runApp(const MyApp());
}
