import 'package:flutter/material.dart';

class PhotoDetail extends StatefulWidget {
  const PhotoDetail({super.key});

  @override
  State<PhotoDetail> createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Detalle Foto Wakala",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
            ),
          )
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            Image.asset("assets/basurero.jpeg"),
            Container(
              margin: const EdgeInsets.only(top:20),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.orange,
                ),
                onPressed: (){},
                child: const Text(
                  "<  Volver  ",
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