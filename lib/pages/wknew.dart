import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NuevoWakala extends StatefulWidget {
  const NuevoWakala({super.key});

  @override
  State<NuevoWakala> createState() => _NuevoWakalaState();
}

class _NuevoWakalaState extends State<NuevoWakala> {
  double largo=150;
  File imageFile1=File("null"),imageFile2=File("null");
  ImagePicker img=ImagePicker();
  _openGallery1(BuildContext context) async{
    var picture= await img.pickImage(source: ImageSource.gallery);
    //var picture=await ImagePicker.
    setState((){
      if(picture!=null){
        imageFile1=File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }
  _openGallery2(BuildContext context) async{
    var picture= await img.pickImage(source: ImageSource.gallery);
    //var picture=await ImagePicker.
    setState((){
      if(picture!=null){
        imageFile2=File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }
  _openCamera1(BuildContext context) async {
    var picture= await img.pickImage(source: ImageSource.camera);
    setState((){
      imageFile1=File(picture!.path);
    });
    Navigator.of(context).pop();
  }
  _openCamera2(BuildContext context) async {
    var picture= await img.pickImage(source: ImageSource.camera);
    setState((){
      imageFile2=File(picture!.path);
    });
    Navigator.of(context).pop();
  }
  Future<void> _showChoiceDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Seleccione"),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                GestureDetector(
                  child: const Text("Galeria"),
                  onTap: () {
                    _openGallery1(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0),),
                GestureDetector(
                  child: const Text("Camara"),
                  onTap: () {
                    _openCamera1(context);
                  },
                )
              ],
            ),
          ),
        );
      }
    );
  }
  Future<void> _showChoiceDialog2(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Seleccione"),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                GestureDetector(
                  child: const Text("Galeria"),
                  onTap: () {
                    _openGallery2(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0),),
                GestureDetector(
                  child: const Text("Camara"),
                  onTap: () {
                    _openCamera2(context);
                  },
                )
              ],
            ),
          ),
        );
      }
    );
  }
  Widget _decideImageView1(){
    if(imageFile1.path=="null"){
      return Image.asset("assets/camara.PNG");
    }
    else{
      return Image.file(imageFile1,width: 400, height: 400);
    }
  }
  Widget _decideImageView2(){
    if(imageFile2.path=="null"){
      return Image.asset("assets/camara.PNG");
    }
    else{
      return Image.file(imageFile2,width: 400, height: 400);
    }
  }
  void _deleteImage1(){
    setState(() {
      imageFile1=File("null");
    });
  }
  void _deleteImage2(){
    setState(() {
      imageFile2=File("null");
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget espacio10=const SizedBox(width:10,height:10);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Avisar por nuevo Wakala",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
            ),
          )
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:[
            espacio10,
            const TextField(
              //controller: usuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sector",
              ),
            ),
            espacio10,
            const TextField(
              //controller: usuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Descripcion",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Column(
                  children:[
                    Container(
                      margin: const EdgeInsets.only(top:10),
                      width: largo,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.orange,
                        ),
                        onPressed: (){
                          _showChoiceDialog1(context);
                        },
                        child: const Text(
                          "Foto 1",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: _decideImageView1(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:10),
                      width: largo,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.orange,
                        ),
                        onPressed: _deleteImage1,
                        child: const Text(
                          "Borrar",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ),
                  ]
                ),
                espacio10,
                Column(
                  children:[
                    Container(
                      margin: const EdgeInsets.only(top:10),
                      width: largo,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.orange,
                        ),
                        onPressed: (){
                          _showChoiceDialog2(context);
                        },
                        child: const Text(
                          "Foto 2",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: _decideImageView2(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:10),
                      width: largo,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.orange,
                        ),
                        onPressed: _deleteImage2,
                        child: const Text(
                          "Borrar",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ),
                  ]
                ),
              ]
            ),
            Container(
              margin: const EdgeInsets.only(top:10),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.orange,
                ),
                onPressed: (){},
                child: const Text(
                  "Denunciar Wakala",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top:10),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.orange,
                ),
                onPressed: (){},
                child: const Text(
                  "Me Arrepentí",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ),
          ]
        ),
      ),
    );
  }
}