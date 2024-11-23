import 'package:countdown_timer_app/components/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/timeSetter", (route) => false);
                      timeProvider.setTimer(0);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 110,
                  ),
                  const Text(
                    "Timer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("images/oval.png"),
                    color: Colors.white,
                    height: 180,
                    opacity: AlwaysStoppedAnimation(.6),
                  ),
                  Image(
                    image: AssetImage("images/oval.png"),
                    color: Colors.white,
                    height: 220,
                    opacity: AlwaysStoppedAnimation(.4),
                  ),
                  Image(
                    image: AssetImage("images/oval.png"),
                    color: Colors.white,
                    height: 260,
                    opacity: AlwaysStoppedAnimation(.2),
                  ),
                  Image(
                    image: AssetImage("images/clock.png"),
                    color: Colors.white,
                    height: 130,
                  ),
                ],
              ),
              Text(
                _formatTime(timeProvider.remainingTime),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: timeProvider.isRunning
                    ? timeProvider.stopTimer
                    : timeProvider.startTimer,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text(
                    timeProvider.isRunning ? "Stop" : "Start",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              TextButton(
                onPressed: timeProvider.resetTimer,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int timeInSeconds) {
    int hours = timeInSeconds ~/ 3600;
    int minutes = (timeInSeconds % 3600) ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}';
  }
}
