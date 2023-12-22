import 'package:dio/dio.dart';
import 'package:evaluacion_2/infraestructure/models/comments.dart';
import 'package:evaluacion_2/infraestructure/models/detailsLocation.dart';
import 'package:evaluacion_2/pages/comment.dart';
import 'package:flutter/material.dart';

class WakalaDetail extends StatefulWidget {
    final int? idLocation;
    final int? idUser;
    const WakalaDetail({Key? key, required this.idLocation, required this.idUser}) : super(key: key);

    @override
    State<WakalaDetail> createState() => _WakalaDetailState(idLocation: idLocation, idUser: idUser);
}

class _WakalaDetailState extends State<WakalaDetail> {
    final int? idLocation;
    final int? idUser;
    List<detailsLocation>? detLocation;
    List<Comment>? comments;
    int? counterStillThere;
    int? counterNotStillThere;

    _WakalaDetailState({required this.idLocation, required this.idUser});

    @override
    void initState() {
        super.initState();
        _loadLocations();
        _loadComments();
    }

    Future<void> _loadLocations() async {
        try {
            final response = await Dio().get('http://10.0.2.2:8000/detailsLocations/$idLocation');
            setState(() {
                detLocation = detailsLocation.listFromJson(response.data);
                counterStillThere = detLocation?[0].stillThere;
                counterNotStillThere = detLocation?[0].notStillThere;
            });
        } catch (error) {
            print('Error fetching locations: $error');
        }
    }

    Future<void> _loadComments() async {
        try {
            final response = await Dio().get('http://10.0.2.2:8000/getComments/$idLocation');
            setState(() {
                comments = Comment.listFromJson(response.data);
            });
        } catch (error) {
            print('Error fetching locations: $error');
        }
    }


    Future<void> stillThere() async{
        await Dio().put('http://10.0.2.2:8000/stillThere/$idLocation');
    }

    Future<void> notStillThere() async{
        await Dio().put('http://10.0.2.2:8000/notStillThere/$idLocation');
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Center(
            child: Text(
                detLocation?[0].sector ?? 'Not data',
                style: const TextStyle(
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
                Text(
                    detLocation?[0].description ?? 'Not data',
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
                Text(
                "Subido por @${detLocation?[0].username} el ${detLocation?[0].registrationDate}",
                style: const TextStyle(color: Colors.blue),
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
                    onPressed: () {
                        _incrementCounterStillThere();
                    },
                    child: Text(
                        "Sigue ahí ($counterStillThere)",
                        style: const TextStyle(fontSize: 16),
                    ),
                    ),
                    TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.orange,
                    ),
                    onPressed: () {
                        _incrementCounterNotStillThere();
                    },
                    child: Text(
                        "Ya no está ($counterNotStillThere)",
                        style: const TextStyle(fontSize: 16),
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
                    onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WakalaComment(sector: detLocation?[0].sector, idLocation: idLocation, idUser: idUser),
                            ),
                        );
                    },
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
                child: ListView.builder(
                    itemCount: comments?.length,
                    itemBuilder: (context, index){
                        return Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text("${comments?[index].comment}\n Por @${comments?[index].username}")
                        );
                            
                    }
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
                    onPressed: (){
                        Navigator.of(context).pop();
                    },
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


    void _incrementCounterStillThere() {
        setState(() {
                counterStillThere = (counterStillThere ?? 0) + 1;
        });
        stillThere();
    }

    void _incrementCounterNotStillThere() {
        setState(() {
                counterNotStillThere = (counterNotStillThere ?? 0) + 1;
        });
        notStillThere();
    }

}