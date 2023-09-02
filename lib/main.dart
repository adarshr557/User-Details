import 'package:flutter/material.dart';
import 'package:user_app/view/home_page.dart';
import 'package:provider/provider.dart';
import 'package:user_app/view_model/home_page_provider.dart';
import 'package:user_app/view_model/second_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => HomepageProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SecondProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
