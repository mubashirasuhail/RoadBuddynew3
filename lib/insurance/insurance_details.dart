import 'package:RoadBuddy/insurance/insurance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';


class InsuranceDetails extends StatefulWidget {
  final String userId;
  final String name;

  const InsuranceDetails({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<InsuranceDetails> createState() => _InsuranceDetailsState();
}

class _InsuranceDetailsState extends State<InsuranceDetails> {
  @override
  Widget build(BuildContext context) {
    getInsurance();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Details'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (ctx1) =>
                        Insurancenew(userId: widget.userId, name: widget.name)),
              );
            },
            child: const Text('+Add Details'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: Insurancelistnotifier,
          builder: (BuildContext ctx, List<InsuranceModel> srvicelist,
              Widget? child) {
            // Filter the list based on userId
            final filteredList =
                srvicelist.where((data) => data.userid == widget.userId).toList();

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (ctx, index) {
                final data = filteredList[index];
                final DateFormat formatter = DateFormat('dd-MM-yyyy');
                final currentDate = DateTime.now();
                final toDate = formatter.parse(data.todate);
                final difference = toDate.difference(currentDate).inDays;

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(data.name2,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Phone:'),
                            Text(data.phone2,
                                style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Insurance Type:'),
                            Text(data.type, style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Vehicle Model:'),
                            Text(data.model, style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Date From:'),
                            Text(data.fromdate,
                                style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('To:'),
                            Text(data.todate, style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        if (difference >= 1 && difference <= 7)
                          Row(
                            children: [
                              Text(
                                'Expiring in $difference day${difference == 1 ? '' : 's'}!!',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        if (difference <= 0)
                          Row(
                            children: [
                              Text(
                                'Expired!!',
                                style: TextStyle(color: Colors.red),
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
