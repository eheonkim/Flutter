import 'package:flutter/material.dart';

class Page3 extends StatefulWidget{
  String data = '';
  Page3({ Key? key, required this.data}) : super(key: key);
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3>{

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(primary: Colors.orange,),
              onPressed: () {
                Navigator.pop(context, '3페이지에서 보냄(Pop)');
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}