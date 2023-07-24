import 'controllers/main_controller.dart';
import 'views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppTest01',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: MainView(),
      ),
    );
  }
}
