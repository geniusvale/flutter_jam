import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterJam());
}

class FlutterJam extends StatefulWidget {
  const FlutterJam({Key? key}) : super(key: key);

  @override
  State<FlutterJam> createState() => _FlutterJamState();
}

class _FlutterJamState extends State<FlutterJam> {
  var Jam = '';

  void mulaiJam() {
    Timer.periodic(Duration(seconds: 1), (_) {
      var tgl = DateTime.now();
      var formatJam = DateFormat.Hms().format(tgl);
      setState(() {
        Jam = formatJam;
      });
    });
  }

  @override
  void initState() {
    mulaiJam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Jam',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Jam'),
        ),
        body: WidgetJam(Jam: Jam),
      ),
    );
  }
}

class WidgetJam extends StatelessWidget {
  const WidgetJam({
    Key? key,
    required this.Jam,
  }) : super(key: key);

  final String Jam;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Jam, style: TextStyle(fontSize: 48),));
  }
}
