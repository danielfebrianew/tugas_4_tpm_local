import 'dart:async';
import 'package:flutter/material.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      laps = [];

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? ("$seconds") : ("0$seconds");
        digitMinutes = (minutes >= 10) ? ("$minutes") : ("0$minutes");
        digitHours = (hours >= 10) ? ("$hours") : ("0$hours");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch',
          style: TextStyle(
            color: _secondColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: _secondColor),
        backgroundColor: _firstColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: _secondColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '$digitHours:$digitMinutes:$digitSeconds',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: _firstColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lap ke-${index + 1}",
                              style: const TextStyle(
                                  color: _secondColor, fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${laps[index]}",
                              style: const TextStyle(
                                  color: _secondColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        (!started) ? start() : stop();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: _firstColor, width: 2),
                      ),
                      child: Text(
                        (!started) ? "Start " : "Pause",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      addLaps();
                    },
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        reset();
                      },
                      fillColor: _firstColor,
                      shape: const StadiumBorder(
                        side: BorderSide(color: _firstColor, width: 2),
                      ),
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                            color: _secondColor, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
