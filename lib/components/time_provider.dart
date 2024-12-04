import 'dart:async';

import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int _remainingTime = 0;
  int _intialTime = 0;
  bool _isRunning = false;
  Timer? _timer;

  int get remainingTime => _remainingTime;
  int get initialTime => _intialTime;
  bool get isRunning => _isRunning;

  void startTimer() {
    if (_timer != null || _remainingTime == 0) return;
    _isRunning = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime > 0) {
          _remainingTime--;
          notifyListeners();
        } else {
          _timer?.cancel();
          _timer = null;
          _remainingTime = _intialTime;
          _isRunning = false;
          notifyListeners();
        }
      },
    );
  }

  void stopTimer() {
    if (_isRunning != true) return;
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _remainingTime = _intialTime;
    notifyListeners();
  }

  void setTimer(int duration) {
    _intialTime = duration;
    _remainingTime = duration;
    notifyListeners();
  }
}
