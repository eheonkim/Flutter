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
        primarySwatch: Colors.blue,
      ),
      // 개발자가 직접 정의한 Page1클래스를 사용함
      home: const Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({ Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지로 교체',style: TextStyle(fontSize: 24)),
              // 2페이지로 전환됨(1페이지는 사라짐)
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
                    // 초단위로 설정
                    transitionDuration: const Duration(milliseconds: 2),
                    // transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                     (context, animation, secondaryAnimation, child){
                      
                      var begin = const Offset(0.0, -1.0);
                      var end = Offset.zero;
                      // 일반적인 애니메이션 곡선 줄때 자세한 것은 교안참조.
                      var curve = Curves.elasticInOut;
                      // Tween을 사용하여 Animation을 Animation으로 변환합니다.
                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var OffsetAnimation = animation.drive(tween);
                      //SlideTransition은 Animation<Offset>을 가져와서
                      //애니메이션 값이 변경될때마다 자식을 변환합니다.
                      return SlideTransition(
                        position: OffsetAnimation,
                        child: child,
                      );
                    }
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('3페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page3(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({ Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page2State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지로 교체',style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('1페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
class Page3 extends StatefulWidget {
  const Page3({ Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page3State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('1페이지로 교체',style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('2페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}