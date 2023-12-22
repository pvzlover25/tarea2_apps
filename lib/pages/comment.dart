import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//Escribir comentario

class WakalaComment extends StatefulWidget {
    final String? sector;
    final int? idLocation;
    final int? idUser;
    const WakalaComment({Key? key, required this.sector, required this.idLocation, required this.idUser}): super(key: key);

    @override
    State<WakalaComment> createState() => _CommentState(sector: sector, idLocation: idLocation, idUser: idUser);
}

class _CommentState extends State<WakalaComment> {
    final String? sector;
    final int? idLocation;
    final int? idUser;
   
    TextEditingController commentController = TextEditingController();

    _CommentState({required this.sector, required this.idLocation, required this.idUser});


    Future<void> makeComment() async {
        String apiUrl = 'http://10.0.2.2:8000/comment/$idLocation?id_user=$idUser';
        Map<String, dynamic> queryParams = {"text": commentController.text};
        await Dio().post(apiUrl, data: jsonEncode(queryParams), options: Options(headers: {'Content-Type': 'application/json',},),);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Center(
            child: Text(
                sector ?? 'No data',
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
            children: [
                TextField(
                    controller: commentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: const InputDecoration(
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
                    onPressed: () {
                        makeComment();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Datos enviados'),
                                content: Text('Se ha agregado un nuevo comentario.'),
                            );
                            },
                        );

                        Future.delayed(Duration(seconds: 2), () {
                            Navigator.pop(context); 
                            Navigator.pop(context); 
                        });
                    },
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
                    onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text("Arrepentido"),
                                    content: const Text("Volverás a la pantalla anterior."),
                                    actions: [
                                        TextButton(
                                            onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                            },
                                            child: const Text("OK"),
                                        )
                                    ]
                                );
                            },
                        );
                    },
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