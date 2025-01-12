import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';

class SleepExerciseTimer extends StatefulWidget {
  final SleepExercise sleepExercise;
  const SleepExerciseTimer({
    super.key,
    required this.sleepExercise,
  });

  @override
  State<SleepExerciseTimer> createState() => _SleepExerciseTimerState();
}

class _SleepExerciseTimerState extends State<SleepExerciseTimer> {
  Timer? _timer;
  int _ramaingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _ramaingTime = widget.sleepExercise.duration * 60;
  }

  //method to start the timer
  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_ramaingTime > 0) {
          _ramaingTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  //Methode to pause the timer
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

//Mehode to stop the timer
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _ramaingTime = widget.sleepExercise.duration * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;

    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sleep Story timer",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sleepExercise.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.sleepExercise.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Duration  :${widget.sleepExercise.duration} minutes",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.sleepExercise.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  _formatTime(_ramaingTime),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRunning ? _pauseTimer() : _startTimer();
                      });
                    },
                    child: Text(
                      _isRunning
                          ? "Pause"
                          : (_ramaingTime < widget.sleepExercise.duration
                              ? "Resume"
                              : "Start"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _stopTimer,
                    child: const Text("Stop"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
