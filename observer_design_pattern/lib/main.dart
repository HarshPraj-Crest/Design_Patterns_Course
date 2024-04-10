import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'StreamBuilder Grid Demo - Observer Pattern';
    return MaterialApp(
      title: 'Grid Demo - Observer Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: appTitle,
      ),
    );
  }
}

/// Root widget for our application
///
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamController<void> _timerStreamController;
  late Timer _timer;
  /// our random generator
  Random rnd = Random();

  @override
  void initState() {
    _timerStreamController = StreamController<void>();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) { 
      _timerStreamController.add(null);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      /// Column layout with a grid of 8x8 tiles
      ///
      body: StreamBuilder<void>(
        stream: _timerStreamController.stream,
        builder: (context,snapshot) {
          return Column(
            children: [
              GridView.count(
                crossAxisCount: 8,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: List.generate(
                  64,
                  (index) => TileWidget(
                   key: ValueKey(index), // Ensure unique key for each tile
                randomValue: rnd.nextInt(10) + 1,
                  ),
                ),
              ),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Call setState. This tells Flutter to rebuild the
          /// UI with the changes.
          setState(() {
            /// do nothing except trigger the UI repaint
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final int randomValue;

  const TileWidget({super.key, required this.randomValue});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0, // Always visible
      duration: const Duration(milliseconds: 200),
      child: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            '$randomValue',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
