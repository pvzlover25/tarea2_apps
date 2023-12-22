import 'package:dio/dio.dart';
import 'package:evaluacion_2/pages/wklist.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../infraestructure/posts.dart';

class Login extends StatefulWidget {
    const Login({super.key});

    @override
    State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    LoginUser? loginUser;
    

    @override
    void initState() {
        super.initState();
    }

    Future<void> login_api() async {
        final String apiUrl = 'http://10.0.2.2:8000/login/${usernameController.text}/${passwordController.text}';

        try {
            final response = await Dio().get(apiUrl, );
            log("STATUS CODE: $response");
            loginUser = LoginUser.fromJson(response.data);
            
        } catch (e) {
            log('Error GET con Dio: $e');
        }
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Center(
                    child: Text(
                        "Wakala 1.0",
                        style: TextStyle(fontSize:30)
                    )
                ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: [
                        const SizedBox(height:25),
                        Center(child: Image.asset("assets/cara.PNG")),
                        const SizedBox(height:10),
                        TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Usuario",
                           ),
                        ),

                        const SizedBox(height:10),

                        TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Contraseña",
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
                                onPressed: () async {
                                await login_api();
                                log("LOGIN USER: $loginUser");
                                if (loginUser?.statusCode == 200) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WakalaList(userId: loginUser?.idUser),
                                        ),
                                    );
                                } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: const Text("Error de inicio de sesión"),
                                                content: const Text("Credenciales incorrectas. Por favor, inténtalo de nuevo."),
                                                actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                            Navigator.of(context).pop();
                                                        },
                                                        child: const Text("OK"),
                                                    )
                                                ]
                                            );
                                        },
                                    );
                                }
                            },
                            child: const Text("Acceder",style: TextStyle(fontSize: 16),),
                            ),
                        ),
                        const SizedBox(height:20),
                        const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text('By:', style: TextStyle(fontSize: 18, color: Colors.blue),),
                                Text('Marco Aguayo', style: TextStyle(fontSize: 22, color: Colors.blue),),
                                Text('Kimberly Valenzuela', style: TextStyle(fontSize: 22, color: Colors.blue),),
                            ]
                        )
                    ],
                ),
            ),
        );
    }
}