import 'package:file_manager/pages/log_message_page.dart';
import 'package:file_manager/pages/show_audit_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Log Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "1"),
                Tab(text: "2"),
                Tab(text: "3"),
                Tab(text: "Show Audit File"),
              ],
            ),
            title: const Text('File Audit Manager'),
          ),
          body: const TabBarView(
            children: [
              LogMessagePage(),
              LogMessagePage(),
              LogMessagePage(),
              ShowAuditFilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
