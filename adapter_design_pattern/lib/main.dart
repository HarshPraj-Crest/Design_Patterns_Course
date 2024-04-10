import 'package:adapter_design_pattern/contact.dart';
import 'package:adapter_design_pattern/json_list.dart';
import 'package:adapter_design_pattern/list_with_separator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('XML Contacts'),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text('JSON Contacts'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('CSV Contact <todo>'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => XMLLongListWithSeparator()));
              } else if (value == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => JsonLongListWithSeparator()));
              }
            },
          ),
        ],
        title: Text(widget.title),
      ),
      body:
          XMLLongListWithSeparator(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
