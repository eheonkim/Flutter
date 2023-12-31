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
      home: const MyHomePage(title: 'Ex13 Textfield2'),
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '내용을 입력하세요.',
                style: TextStyle( fontSize: 30.0),
              ),
              /*
                  텍스트 필드를 멀티라인을 ㅗ사용하는 경우 화면사이즈를 넘어가면 제대로 표현되지
                  않으므로 이때는 Expanded위젯으로 감싸준다. 이때 Ctrl + .을 사용하면 된다.
                  (지울때도 마찬가지)
              */
              Expanded(
                child: TextField(
                  maxLength: 50,  // 입력할 문자열의 길이
                  maxLines: 30, // 30줄로 설정
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent,
                                              width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                    // labelText: '내용 입력',
                    // counterText: "", // maxLength 를 감춘다.
                    counterStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.red,
                                  ),
                  ),
                  onChanged: (text) {
                    print(text);
                  },
                  onSubmitted: (text) {
                    print('Submitted : $text');
                  },
                )
              ),
              ElevatedButton(
                child: const Text('키보드내리기',
                                  style: TextStyle(fontSize: 24,
                                  color: Colors.black54)),
                onPressed: () => _onClick(),
              ),
            ],
          )
      ),
    );
  } 

  void _onClick(){
    FocusScope.of(context).unfocus();
  }
}
