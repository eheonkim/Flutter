import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home: const MyHomePage(title: 'Ex50 Exam'),
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
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                // 레코드 조회
                child: const Text('Http(Get)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _getRequest();
              },
            ),
            ElevatedButton(
              // 레코드 입력
              child: const Text('Http (Post)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _postRequest();
              },
            ),
          ],
        )
      ),
    );
  }

  void _getRequest() async {
    // https://sample.bmaster.kro.kr/contacts 여기에서 숫자 하나 복사할 것
    var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/1694663623520");
    http.Response response = await http.get(
      url,
      headers: {"Accept": "application/json"}
    );
    // 접속 상태
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
  } 

  void _postRequest() async{
     var url = Uri.parse("https://sample.bmaster.kro.kr/contacts");
     // 데이터를 가져가라고 요청
     http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "name" : "네모",
          "tel": 010-1111-2222,
          "address":"서울시 종로구"
        },
     );

     var statusCode = response.statusCode;
     //var responseHeaders = response.headers;
     var responseBody = utf8.decode(response.bodyBytes);

     print("statusCode: $statusCode");
     //print("responseHeaders: $responseHeaders");
     print("responseBody: $responseBody");
  }
}
