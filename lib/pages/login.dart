import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            const TextField(
              //controller: usuario,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Usuario",
              ),
            ),
            const SizedBox(height:10),
            const TextField(
              //controller: usuario,
              decoration: InputDecoration(
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
                onPressed: (){},
                child: const Text(
                  "Acceder",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
    );
  }
}