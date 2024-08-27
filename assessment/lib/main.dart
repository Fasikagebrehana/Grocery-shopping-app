import 'package:assessment/dependency_injection.dart';
import 'package:assessment/features/grocery/presentation/pages/details.dart';
import 'package:assessment/features/grocery/presentation/pages/home_page.dart';
import 'package:assessment/features/grocery/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Grocery App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: const SplashScreen(),
      routes: {
        '/homepage': (context) =>  HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}