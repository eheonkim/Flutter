import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
      home: const MyHomePage(title: 'Ex52_camera'),
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

  final ImagePicker _picker = ImagePicker();
  File? mPhoto; // null 일수도 있다.
  XFile? image;

  @override
  Widget build(BuildContext context) {
    // widget photo = (mPhoto != null)? Image.file(mphoto)
    late Widget photo;
    if (mPhoto !=null) {
      photo = Image.file(
                mPhoto!,
                fit:BoxFit.contain
      );
    } else {
      photo = Text('EMPTY');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Album', style: TextStyle(fontSize: 24)),
                    onPressed: () => takePhoto(ImageSource.gallery),
                  ),
                  SizedBox(width: 5,),
                  ElevatedButton(
                    child: const Text('Camera', style: TextStyle(fontSize: 24)),
                    onPressed: () => takePhoto(ImageSource.camera),
                  ),
                  SizedBox(width: 5,),
                  ElevatedButton(
                    child: const Text('Save', style: TextStyle(fontSize: 24)),
                    onPressed: () => savePhoto(),
                  ),
                ],
              ),
              Expanded(
                child: photo
              ),
            ],
          ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
   // 이미지 가져오기
   // final XFile? image = await _picker.pickImage(soure: source) 
  
    image = await _picker.pickImage(source: source);
    setState(() {
      mPhoto = File(image!.path);
    });
  }

  void savePhoto() async {
    /*
    await _picker.pickImage(source: ImageSource.camera)
    .then((XFile? image) {
      if (image !=null) {
        setState(() {
          mPhoto = File(image.path);
        });

        GallerySaver.saveImage(image.path)
        .then((bool? success) {
          print("image saved on galler... $success");
        });
      }
    });
    */
    // mPhoto
    if (image != null){
      GallerySaver.saveImage(image!.path)
      .then((bool? success) {
        print("Image saved on gallery...");
      });
    
    }
  } 
}
