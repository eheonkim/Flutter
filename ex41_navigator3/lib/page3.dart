import 'package:flutter/material.dart';
import 'page3.dart';

// ignore: must_be_immutable
class Page3 extends StatefulWidget{
  String data = '';
  Page3({super.key, required this.data});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page2State extends State<Page3>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pop() 메서드로 페이지를 스택에서 제거하고, 파라미터를 보낸다.
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: ()  {
                Navigator.pop(context,'3페이지에서 보냄(Pop)');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
             style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade100,
             ),
             onPressed: () {
              // 화면 전환시 파라미터 전달
               Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Page2(
                    data: '3페이지에서 보냄(Replacement)',
                  ),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
             },
             child: const Text('2페이지로 변경', style: TextStyle(fontSize: 24)),
            ),
            // 파라미터로 전달받은 값을 텍스트 위젯에 출력
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}