import 'package:flutter/material.dart';

class WakalaDetail extends StatefulWidget {
  const WakalaDetail({super.key});

  @override
  State<WakalaDetail> createState() => _WakalaDetailState();
}

class _WakalaDetailState extends State<WakalaDetail> {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            const Text(
              "Lorem ipsum dolor sit amet consectetur adipiscing, "
              "elit metus bibendum dignissim imperdiet, turpis vehicula in aenean risus. "
              "Penatibus justo tincidunt parturient magnis feugiat nibh, per erat urna at mi."
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/basurero.jpeg")
                ),
                const SizedBox(width:10),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/basurero.jpeg")
                ),
              ]
            ),
            const Text(
              "Subido por @chalalo el 22/09/2022",
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.orange,
                  ),
                  onPressed: (){},
                  child: const Text(
                    "Sigue ahí (30)",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.orange,
                  ),
                  onPressed: (){},
                  child: const Text(
                    "Ya no está (1)",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Comentarios",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  )
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  onPressed: (){},
                  child: const Text(
                    "Comentar",
                    //style: TextStyle(fontSize: 16),
                  ),
                ),
              ]
            ),
            SizedBox(
              //width: 300,
              height: 150,
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("La we... feaaaaaaaaaaaaaaaa\n Por @jose")
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("Yo pise caca ahiiiiii arggggggggg\n Por @juan")
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("comentario 3\n Por @usuario_3")
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text("comentario 4\n Por @usuario_4")
                  ),
                ],
               ),
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
                  "< Volver al listado  ",
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