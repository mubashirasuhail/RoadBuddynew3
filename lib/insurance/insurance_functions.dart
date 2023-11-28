import 'package:RoadBuddy/db/data_model.dart';

import 'package:flutter/material.dart';

import 'package:RoadBuddy/db/dbfunction.dart';



Future<void> onAddbutton(
  String userId,
  TextEditingController nameController,
  TextEditingController typeController,
  TextEditingController phoneController,
  TextEditingController modelController,
  TextEditingController fromDateController,
  TextEditingController toDateController,
) async {
  final _name = nameController.text.trim();
  final _type = typeController.text.trim();
  final _phone = phoneController.text.trim();
  final _model = modelController.text.trim();
  final _fromDate = fromDateController.text.trim();
  final _toDate = toDateController.text.trim();

  if (_name.isEmpty ||
      _type.isEmpty ||
      _phone.isEmpty ||
      _model.isEmpty ||
      _fromDate.isEmpty ||
      _toDate.isEmpty) {
    return;
  }

  final _insuranceModel = InsuranceModel(
    name2: _name,
    type: _type,
    phone2: _phone,
    model: _model,
    fromdate: _fromDate,
    todate: _toDate,
    userid: userId,
  );

  addinsurance(_insuranceModel);
}
