import 'package:flutter/material.dart';

//ignore : must_be_immutable
class Page1 extends StatefulWidget
{
  // main.dart에서 전달한 파라미터를 받기위해 변수를 선언한 후 생성자에 추가한다.
  // 또한 required가 있으므로 필수적으로 받아야하는 값이 된다.
  String data = '';
  Page1({ Key? key, required this.data}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();

  class _Page1State extends State<Page1>{

    @override
    Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page1'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
                onPressed: () async {
                  // var로 설정. String으로 받으면 에러가 발생
                  var result = await Navigator.pushNamed(context, '/page2');
                  print('result(from 2) : $result');
                  setState((){
                    widget.data = result as String;
                  });
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('3페이지 추가', style: TextStyle(fontSize: 24)),
                // 동작 방식은 동일함. 콜백이 성공하면 then()절 실행됨.
                onPressed: () async{
                  // Rout에서는 push()eotls pushNamed()(경로를 지정한다.)
                  // 새로운 페이지에서 콜백데이터가 올때까지
                  await Navigator.pushNamed(
                    context, '/page3'
                  ).then((result) {
                    print('result(from 3) : $result');
                    setState(() {
                      widget.data = result as String;
                    });
                  });
                },
              ),
              // 앱 실행 초기에는
              Text(widget.data, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      );
    }
  }
}
