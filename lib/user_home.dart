import 'package:flutter/material.dart';
import 'package:RoadBuddy/bottom_navigation.dart';
import 'package:RoadBuddy/user_home_new.dart';
import 'package:RoadBuddy/restaurant/user_restaurant.dart';
import 'package:RoadBuddy/service_station/user_servicestation.dart';
import 'package:RoadBuddy/taxi/user_taxi.dart';

class HomeScreen1 extends StatefulWidget {
  final String userId;
  final String name;
  static ValueNotifier<int> selectedIndexNotifiier = ValueNotifier(0);

  HomeScreen1({required this.userId, required this.name, Key? key})
      : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreeNnew(userId: widget.userId, name: widget.name),
      ServiceStation2(),
      TaxiUser(),
      RestaurantUser(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: HomeScreen1.selectedIndexNotifiier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
