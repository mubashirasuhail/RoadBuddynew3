import 'package:flutter/material.dart';
import 'package:RoadBuddy/user_home_new.dart';
import 'package:intl/intl.dart';

import 'insurance_functions.dart';

class InsuranceForm extends StatefulWidget {
  final String userId;
  final String name;

  InsuranceForm({
    required this.userId,
    required this.name,
    Key? key,
  }) : super(key: key);
  @override
  State<InsuranceForm> createState() => _InsuranceFormState();
}
class _InsuranceFormState extends State<InsuranceForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                       
                           Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Name of insured',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      return 'Name empty';
                                    } else {
                                      setState(() {
                                        _validate = false;
                                      });
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextFormField(
                                  controller: typeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Insurance type',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      return 'Insurance type empty';
                                    } else {
                                      setState(() {
                                        _validate = false;
                                      });
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Contact',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validate= true;
                                      });
                                      return 'Contact empty';
                                    } else {
                                      setState(() {
                                        _validate = false;
                                      });
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextFormField(
                                  controller: modelController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Vehicle Model',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      return 'Vehicle Model empty';
                                    } else {
                                      setState(() {
                                        _validate = false;
                                      });
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                              Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Period of Insurance',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(
                                controller: fromDateController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: 'Date From dd-MM-yyyy',
                                ),
                                onTap: () async {
                                  final selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.blue,
                                          secondaryHeaderColor: Colors.blue,
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.blue),
                                          buttonTheme: ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (selectedDate != null &&
                                      !selectedDate.isAfter(DateTime.now())) {
                                    fromDateController.text =
                                        DateFormat('dd-MM-yyyy')
                                            .format(selectedDate);
                                    setState(() {
                                      _validate = false;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      _validate = true;
                                    });
                                    return 'empty';
                                  }

                                  final DateFormat format =
                                      DateFormat('dd-MM-yyyy');
                                  try {
                                    final toDate = format.parseStrict(value);
                                    final fromDate = format
                                        .parseStrict(fromDateController.text);

                                    if (fromDate.isAfter(toDate)) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      return 'From date cannot be later than To date';
                                    }
                                  } catch (e) {
                                    setState(() {
                                      _validate = true;
                                    });
                                    return 'Invalid date format (dd-MM-yyyy)';
                                  }

                                  setState(() {
                                    _validate = false;
                                  });
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(
                                controller: toDateController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: 'Date Upto dd-MM-yyyy',
                                ),
                                onTap: () async {
                                  final selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.blue,
                                          secondaryHeaderColor: Colors.blue,
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.blue),
                                          buttonTheme: ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );

                                  if (selectedDate != null &&
                                      !selectedDate.isBefore(DateTime.now())) {
                                    toDateController.text =
                                        DateFormat('dd-MM-yyyy')
                                            .format(selectedDate);
                                    setState(() {
                                      _validate = false;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      _validate = true;
                                    });
                                    return 'empty';
                                  }

                                  final DateFormat format =
                                      DateFormat('dd-MM-yyyy');
                                  try {
                                    final toDate = format.parseStrict(value);
                                    final fromDate = format
                                        .parseStrict(fromDateController.text);

                                    if (fromDate.isAfter(toDate)) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      return 'From date cannot be later than To date';
                                    }
                                  } catch (e) {
                                    setState(() {
                                      _validate = true;
                                    });
                                    return 'Invalid date format (dd-MM-yyyy)';
                                  }

                                  setState(() {
                                    _validate = false;
                                  });
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onAddbutton(
                                    widget.userId,
                                    nameController,
                                    typeController,
                                    phoneController,
                                    modelController,
                                    fromDateController,
                                    toDateController,
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (ctx1) {
                                      return AlertDialog(
                                        title: const Text('Data saved'),
                                        content: const Text(
                                            'Data saved successfully'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!.validate())
                                              {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        HomeScreeNnew(
                                                          userId: widget.userId,
                                                          name: widget.name,
                                                        )),
                                                (route) => false,
                                              );
                                              } else {
    print('Data empty or invalid');
  }
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  print('Data empty or invalid');
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
