import 'package:evaluacion_2/pages/login.dart';
import 'package:evaluacion_2/pages/wklist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const WakalaDetail(idLocation: 9,),
      //home: const WakalaList(userId: 10,),
      //home: const Comment()
      //home: const NuevoWakala()
      home: const Login()
    );
  }
}

