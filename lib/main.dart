import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_center_app/firebase_options.dart';
import 'knowledge_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KnowledgeScreen(),
    );
  }
}
