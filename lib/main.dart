import 'package:countdown_timer_app/components/time_provider.dart';
import 'package:countdown_timer_app/views/time_setter_view.dart';
import 'package:countdown_timer_app/views/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: MaterialApp(
        home: const TimeSetter(),
        routes: {
          '/timer': (context) => const TimerView(),
          '/timeSetter': (context) => const TimeSetter(),
        },
      ),
    );
  }
}
