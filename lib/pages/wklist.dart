
import 'package:intl/intl.dart';
import 'package:evaluacion_2/infraestructure/models/locations.dart';
import 'package:evaluacion_2/pages/detail.dart';
import 'package:evaluacion_2/pages/wknew.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WakalaList extends StatefulWidget {
    final int? userId;
    const WakalaList({Key? key, required this.userId}): super(key: key);

  @override
  State<WakalaList> createState() => _WakalaListState(userId: userId);
}

class _WakalaListState extends State<WakalaList> {
    final int? userId;
    List<Location>? locations;

    _WakalaListState({required this.userId});

    @override
    void initState() {
        super.initState();
        
        _loadLocations();
        
    }

    Future<void> _loadLocations() async {
        try {
            final response = await Dio().get('http://10.0.2.2:8000/locations/');
            setState(() {
                locations = Location.listFromJson(response.data);
            });
        } catch (error) {
            print('Error fetching locations: $error');
        }
    }

    String formattedDate(String originalDate){
        DateTime dateTime = DateTime.parse(originalDate);
    
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        return formattedDate;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Listado de Wakalas",
              style: TextStyle(color: Colors.blue, fontSize: 25)),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: locations?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locations?[index].sector ?? 'Not data',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text('por @${locations?[index].username}', style: const TextStyle(fontSize: 16.0)),
                          Text('   ${locations?[index].registrationDate}', style: const TextStyle(fontSize: 16.0)),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WakalaDetail(idLocation: locations?[index].idLocation, idUser: userId,),
                            ),
                        );
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NuevoWakala(userId: userId),
                ),
            );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
