import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: const MyHomePage(title: 'Ex56_urllauncher'),
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
  // 전달된 파라미터에 따라 uri_launcher가 판단하여
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
              child: const Text('https', style: TextStyle(fontSize: 24)),
              onPressed: () => _launchURL('https://m.google.com'),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
              child: const Text('tel', style: TextStyle(fontSize: 24)),
                                // 자동 전화 걸기에 많이 사용
              onPressed: () => _launchURL('tel:010-1234-5678'),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('sms', style: TextStyle(fontSize: 24)),
                                // 스팸 , 광고, 안전문자
                onPressed: () => _sendSMS(),
                ),
                  const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('email', style: TextStyle(fontSize: 24)),
                                 // 스팸 , 광고, 
                onPressed: () => _sendEmail(),
                ),
                const SizedBox(height: 10,),
            ],
          ),
      ),
    );
  } 

  void _launchURL(url) async {
    Uri _url = Uri.parse(url);
    await canLaunchUrl(_url) ? await launchUrl(_url) : throw 'Could not launch $url';
  }

  void _sendSMS() {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '010-1234-5678',
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );

    launchUrl(smsLaunchUri);
  }
  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
    
    launchUrl(emailLaunchUri);
  }
  String? encodeQueryParameters(Map<String, String> params){
    return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
  }
}