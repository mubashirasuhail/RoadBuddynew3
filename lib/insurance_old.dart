import 'package:flutter/material.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/user_home_new.dart';
import 'package:intl/intl.dart';

class Insurance2 extends StatefulWidget {
  final String userId;
  final String name;
  const Insurance2({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<Insurance2> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance2> {
  bool _validateName = false;
  bool _validateType = false;
  bool _validatePhone = false;
  bool _validateModel = false;
  bool _validateFromDate = false;
  bool _validateToDate = false;

  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final phoneController = TextEditingController();
  final modelController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
      body: Container(
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
                               /*
                          CustomTextField(
                            controller: nameController,
                            hintText: 'Name of insured',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name empty';
                              }
                              return '';
                            },
                          ),
                          CustomTextField(
                            controller: typeController,
                            hintText: 'Insurance type',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insurance type empty';
                              }
                              return '';
                            },
                          ),
                          CustomTextField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            hintText: 'Contact',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Contact empty';
                              }
                              return '';
                            },
                          ),
                          CustomTextField(
                            controller: modelController,
                            hintText: 'Vehicle Model',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vehicle Model empty';
                              }
                              return '';
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Period of Insurance',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),*/
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
                                        _validatePhone = true;
                                      });
                                      return 'Name empty';
                                    } else {
                                      setState(() {
                                        _validatePhone = false;
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
                                        _validatePhone = true;
                                      });
                                      return 'Insurance type empty';
                                    } else {
                                      setState(() {
                                        _validatePhone = false;
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
                                        _validatePhone = true;
                                      });
                                      return 'Contact empty';
                                    } else {
                                      setState(() {
                                        _validatePhone = false;
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
                                        _validatePhone = true;
                                      });
                                      return 'Vehicle Model empty';
                                    } else {
                                      setState(() {
                                        _validatePhone = false;
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
                                      builder: (BuildContext context,
                                          Widget? child) {
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
                                        !selectedDate
                                            .isAfter(DateTime.now())) {
                                      fromDateController.text = DateFormat(
                                          'dd-MM-yyyy').format(selectedDate);
                                      setState(() {
                                        _validateFromDate = false;
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validateFromDate = true;
                                      });
                                      return 'empty';
                                    }

                                    final DateFormat format =
                                    DateFormat('dd-MM-yyyy');
                                    try {
                                      final toDate =
                                      format.parseStrict(value);
                                      final fromDate =
                                      format.parseStrict(
                                          fromDateController.text);

                                      if (fromDate.isAfter(toDate)) {
                                        setState(() {
                                          _validateFromDate = true;
                                        });
                                        return 'From date cannot be later than To date';
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _validateFromDate = true;
                                      });
                                      return 'Invalid date format (dd-MM-yyyy)';
                                    }

                                    setState(() {
                                      _validateFromDate = false;
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
                                      builder: (BuildContext context,
                                          Widget? child) {
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
                                        !selectedDate.isBefore(
                                            DateTime.now())) {
                                      toDateController.text = DateFormat(
                                          'dd-MM-yyyy').format(selectedDate);
                                      setState(() {
                                        _validateToDate = false;
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _validateToDate = true;
                                      });
                                      return 'empty';
                                    }

                                    final DateFormat format =
                                    DateFormat('dd-MM-yyyy');
                                    try {
                                      final toDate =
                                      format.parseStrict(value);
                                      final fromDate =
                                      format.parseStrict(
                                          fromDateController.text);

                                      if (fromDate.isAfter(toDate)) {
                                        setState(() {
                                          _validateToDate = true;
                                        });
                                        return 'From date cannot be later than To date';
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _validateToDate = true;
                                      });
                                      return 'Invalid date format (dd-MM-yyyy)';
                                    }

                                    setState(() {
                                      _validateToDate = false;
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
                                    onAddbutton();
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
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          HomeScreeNnew(
                                                            userId:
                                                            widget.userId,
                                                            name: widget.name,
                                                          )),
                                                  (route) => false,
                                                );
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
      ),
    );
  }

  Future<void> onAddbutton() async {
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
      userid: widget.userId,
    );

    addinsurance(_insuranceModel);
  }
}
