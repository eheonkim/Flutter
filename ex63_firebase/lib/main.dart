import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex63 Firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String name = '';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:920605619471:android:96e8664edc30c637e7fa7a',
    apiKey: 'AIzaSyB5wMC1zM4EIPpVTWR1wnOaapnK9iyMpFY',
    projectId: 'flutter-exam-924ab',
    messagingSenderId: '920605619471', 
  );

  Future<void> initializeDefault() async{
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

  Future<void> initializeSecodary() async{
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(name: name, options: firebaseOptions);
    print('Initialized $app');
  }

  void apps(){
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions? options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async{
    final FirebaseApp app = Firebase.app(name);
    print('App $name deleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ElevatedButton(
                child: const Text('Initialize default app'),
                onPressed: initializeDefault,
              ),
               ElevatedButton(
                child: const Text('Initialize secondary app'),
                onPressed: initializeSecodary,
              ),
               ElevatedButton(
                child: const Text('Get apps'),
                onPressed: apps,
              ),
               ElevatedButton(
                child: const Text('List options'),
                onPressed: options,
              ),
            ],
          )
      ),
    );
  } 
}
