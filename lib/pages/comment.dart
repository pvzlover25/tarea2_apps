import 'package:flutter/material.dart';

//Escribir comentario

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Dentro de multicancha",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
            ),
          )
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Descripción",
              ),
            ),
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
                  "Comentar Wakala",
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
      )
    );
  }
}