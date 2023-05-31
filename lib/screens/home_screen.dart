import 'package:flutter/material.dart';
import 'package:speed_app/bloc/speed_bloc.dart';
import 'package:speed_app/bloc/speed_event.dart';
import 'package:speed_app/bloc/speed_state.dart';
import 'package:speed_app/widgets/placing_ranges.dart';
import 'package:speed_app/widgets/speedometer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final _rangeTxtController = TextEditingController();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: widget._rangeTxtController,
                  decoration: const InputDecoration(label: Text('Enter Range')),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    context.read<SpeedBloc>().add(SpeedEvent(int.parse(widget._rangeTxtController.text)));
                  },
                  child: const Text('Submit')),
              const SizedBox(height: 100),
              BlocBuilder<SpeedBloc, SpeedState>(

                builder: (context, state) {

                  return CustomPaint(
                    size: const Size(300, 300),
                    painter: SpeedoMeter(state.userRange),
                    foregroundPainter: PlacingRanges(),
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
