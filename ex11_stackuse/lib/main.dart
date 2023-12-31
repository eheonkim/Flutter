import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Ex11 Stackuse'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getStack1(),
            const SizedBox(height: 10,),
            getStack2(),
            const SizedBox(height: 10,),
            getStack3(),
            const SizedBox(height: 10,),
            getStack4(),
          ],
        ),
      )
    );
  } 
  Widget getStack1(){
    return Stack(
      //fit: StackFit.expand,
      // alignment: AlignmentDirectional.bottomCenter,
      children: <Widget> [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Container(
          width: 60,
          height: 60,
          color: Colors.blue,
        )
      ],
    );
  }
  Widget getStack2(){
    return Stack(
      children: <Widget>[
        Container(
          width: 120,
          height:120,
          color: Colors.red,
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
  Widget getStack3() {
    return Stack(
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Positioned(
          top: 30,
          left: 30,
          width: 120,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
   Widget getStack4() {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Positioned(
          top: 30,
          left: 30,
          width: 120,
          height: 120,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
