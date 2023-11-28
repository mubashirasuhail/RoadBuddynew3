import 'package:flutter/material.dart';
import 'package:RoadBuddy/service_station/service_create.dart';
import 'package:RoadBuddy/service_station/service_update.dart';

import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class ServiceStation1 extends StatefulWidget {
  const ServiceStation1({super.key});

  @override
  State<ServiceStation1> createState() => _servicestationState();
}

class _servicestationState extends State<ServiceStation1> {
  // bool _dataLoaded = false; // Add this line to define the flag

  @override
  /*void initState() {
    super.initState();
    if (!_dataLoaded) {
      getAllservice();
      _dataLoaded = true;
    }
  }*/
  @override
  Widget build(BuildContext context) {
    // Call your function to get the list of service stations here
    getAllservice();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Stations',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx1) => const ServiceCreate()),
              );
            },
            child: const Text('+ Create'),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/back2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: ServiceListNotifier,
          builder:
              (BuildContext ctx, List<ServiceModel> srvicelist, Widget? child) {
            return ListView.builder(
              itemCount: srvicelist.length,
              itemBuilder: (ctx, index) {
                final data = srvicelist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(data.name1,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ServiceUpdate(
                                      name1: data.name1,
                                      place: data.place,
                                      id: data.id,
                                      phone1: data.phone1,
                                      city: data.city,
                                    )));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            //
                            showDialog(
                                context: context,
                                builder: (ctx1) {
                                  return AlertDialog(
                                    title: const Text('Delete'),
                                    content: const Text(
                                        'Do you want delete this item'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx1).pop();
                                        },
                                        child: const Text('close'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (data.id != null) {
                                            deleteService(data.id!);
                                          }
                                          Navigator.of(ctx1).pop();
                                        },
                                        child: const Text('yes'),
                                      ),
                                    ],
                                  );
                                });

                            //}
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Handle item tap
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Serviceupdate(name: data.name1,place: data.place,id: data.id,phone: data.phone1,city: data.city,)));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
