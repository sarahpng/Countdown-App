import 'package:countdown_timer_app/components/time_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeSetter extends StatefulWidget {
  const TimeSetter({super.key});

  @override
  State<TimeSetter> createState() => _TimeSetterState();
}

class _TimeSetterState extends State<TimeSetter> {
  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const Text(
                "Setup",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 150,
              ),
              CupertinoTheme(
                data: const CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoTimerPicker(
                  // backgroundColor: Colors.black,
                  mode: CupertinoTimerPickerMode.hms,
                  onTimerDurationChanged: (duration) {
                    if (duration.inSeconds > 0) {
                      timeProvider.setTimer(duration.inSeconds);
                    }
                  },
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  if (timeProvider.initialTime > 0) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/timer', (route) => false);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text(
                    "Set Timer",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void setTime(Duration duration) {}
}
