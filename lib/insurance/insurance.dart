import 'package:flutter/material.dart';

import 'insurance_form.dart'; // Import the InsuranceForm

class Insurancenew extends StatefulWidget {
  final String userId;
  final String name;

  const Insurancenew({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<Insurancenew> createState() => _InsurancenewState();
}

class _InsurancenewState extends State<Insurancenew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insurance Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: InsuranceForm(userId: widget.userId, name: widget.name), 
    );
  }
}
