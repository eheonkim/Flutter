import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/home.dart';
import 'package:provider/provider.dart';
import 'package:open_api_xml_parser/src/provider/ev_provider.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => EvProvider())
        ],
        child: const Home() // home.dart,
      )
    );
  }
}