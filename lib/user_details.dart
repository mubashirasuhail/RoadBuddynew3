import 'package:flutter/material.dart';

import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  // bool _dataLoaded = false; // Add this line to define the flag
  @override
  @override
  Widget build(BuildContext context) {
    // Call your function to get the list of service stations here
    getAllusers();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User List',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/back2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: UserListNotifier,
          builder: (BuildContext ctx, List<UserModel> usrlist, Widget? child) {
            return ListView.builder(
              itemCount: usrlist.length,
              itemBuilder: (ctx, index) {
                final data = usrlist[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      data.name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('ID:'),
                            Text(
                              data.id.toString(),
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Phone:'),
                            Text(
                              data.phone,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
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
