import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NuevoWakala extends StatefulWidget {
    final int? userId;
    const NuevoWakala({Key? key, required this.userId}) : super(key: key);

    @override
    State<NuevoWakala> createState() => _NuevoWakalaState(userId: userId);
}

class _NuevoWakalaState extends State<NuevoWakala> {
    final int? userId;
    double largo=150;
    
    TextEditingController sectorController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
 
    String? photo1 = "photo1";
    String? photo2 = "photo2";

    _NuevoWakalaState({required this.userId});

    Future<void> _newLocations() async {
        try {
            String apiUrl = 'http://10.0.2.2:8000/addLocation/?id_user=${userId}';
            Map<String, dynamic> queryParams = {
                'sector': sectorController.text,
                'description': descriptionController.text,
                'photo1': photo1,
                'photo2': photo2
            };
            await Dio().post(apiUrl, data: jsonEncode(queryParams), options: Options(headers: {'Content-Type': 'application/json',},),);
            

        } catch (error) {
            print('Error fetching locations: $error');
        }
    }

    Widget tomarFoto(String s){
        return Column(
            children:[
                Container(
                    margin: const EdgeInsets.only(top:10),
                    width: largo,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.orange,
                        ),
                        onPressed: (){},
                        child: Text(
                            s,
                            style: const TextStyle(fontSize: 16),
                        ),
                    )
                ),
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/camara.PNG"),
                ),
                Container(
                    margin: const EdgeInsets.only(top:10),
                    width: largo,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            foregroundColor: Colors.orange,
                        ),
                        onPressed: (){},
                        child: const Text(
                            "Borrar",
                            style: TextStyle(fontSize: 16),
                        ),
                    )
                ),
            ]
        );
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
                child: Column(
                    children:[
                        espacio10,
                        TextField(
                            controller: sectorController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Sector",
                            ),
                        ),
                        espacio10,
                        TextField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Descripcion",
                            ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                                tomarFoto("Foto 1"),
                                espacio10,
                                tomarFoto("Foto 2"),
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
                                onPressed: (){
                                    _newLocations();

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: Text('Datos enviados'),
                                            content: Text('Se ha agregado un nuevo wakala correctamente.'),
                                        );
                                        },
                                    );

                                    Future.delayed(Duration(seconds: 2), () {
                                        Navigator.pop(context); 
                                        Navigator.pop(context); 
                                    });
                                },
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
                                onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: const Text("Arrepentido"),
                                                content: const Text("Volverás a la pantalla principal."),
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
            ),
        );
    }
}