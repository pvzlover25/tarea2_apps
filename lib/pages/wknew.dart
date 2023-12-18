import 'package:flutter/material.dart';

class NuevoWakala extends StatefulWidget {
  const NuevoWakala({super.key});

  @override
  State<NuevoWakala> createState() => _NuevoWakalaState();
}

class _NuevoWakalaState extends State<NuevoWakala> {
  double largo=150;
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