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
      home: const MyHomePage(title: 'Ex25 Scrollview'),
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
          child: Container( //#3
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            // 아래 가로, 세로 부분을 주석처리하면 화면을 꽉채우게
            width: 300, // 크기를 지정하지 않으면 부모크기
            height: 500, // // 자식크기
            color: Colors.cyan,
            alignment: Alignment.topLeft,

            child: SingleChildScrollView( // #2
              // 스크롤 방향을 수직방향으로 설정
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // #1
                  // 화면을 벗어날 정도의 컨테이너를 추가한다.
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[700],
                    child: Text('Entry A', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[500],
                    child: Text('Entry b', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[300],
                    child: Text('Entry c', style: TextStyle(fontSize: 30)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.amber[100],
                    child: Text('Entry d', style: TextStyle(fontSize: 30)),
                  )
                ],
              ),
            ),
          )
      ),
    );
  } 
}
