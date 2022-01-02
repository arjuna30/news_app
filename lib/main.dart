import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/src/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
