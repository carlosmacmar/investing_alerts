import 'package:flutter/material.dart';
import 'package:investing_alerts/features/company/presentation/pages/home_page.dart';
import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investing Alerts',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        accentColor: Colors.blue.shade600,
      ),
      home: HomePage(),
    );
  }
}
