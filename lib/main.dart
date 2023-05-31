import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:speed_app/bloc/speed_bloc.dart';
import 'dart:math' as math;

import 'package:speed_app/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SpeedBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
