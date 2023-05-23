import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  StreamController<int> _streamController = StreamController<int>();
  Stream<int> _timerStream = Stream.empty();
  int _lastSecond = 0;

  @override
  void initState() {
    super.initState();
    _timerStream = _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      _streamController.add(_stopwatch.elapsedMilliseconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _timerStream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                int milliseconds = snapshot.data!;
                int seconds = (milliseconds / 1000).floor();
                int minutes = (seconds / 60).floor();
                int hours = (minutes / 60).floor();
                int displaySeconds = seconds - (minutes * 60);
                int displayMinutes = minutes - (hours * 60);

                if (seconds != _lastSecond) {
                  _lastSecond = seconds;
                  // lakukan sesuatu setiap detik berubah, misalnya merubah background
                  // color stopwatch
                }

                return Text(
                  '${hours.toString().padLeft(2, '0')}:${displayMinutes
                      .toString().padLeft(2, '0')}:${displaySeconds.toString()
                      .padLeft(2, '0')}.${(milliseconds % 1000 ~/ 10)
                      .toString()
                      .padLeft(2, '0')}',
                  style: TextStyle(fontSize: 50.0),
                );
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_isRunning) {
                      _stopwatch.stop();
                      setState(() {
                        _isRunning = false;
                      });
                    } else {
                      _stopwatch.start();
                      setState(() {
                        _isRunning = true;
                      });
                      startTimer();
                    }
                  },
                  child: Text(_isRunning ? 'Stop' : 'Start'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _stopwatch.stop();
                    setState(() {
                      _isRunning = false;
                    });
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _stopwatch.reset();
                    setState(() {
                      _isRunning = false;
                    });
                    _streamController.add(0);
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
