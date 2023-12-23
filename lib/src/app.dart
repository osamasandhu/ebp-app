import 'package:epb_app/src/base/app_theme.dart';
import 'package:epb_app/src/components/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._({Key? key}) : super(key: key);

  static Future<void> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp._());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EBP',
     debugShowCheckedModeBanner: false, home: const DashboardPage(),
      theme: AppTheme.lightTheme,
    );
  }
}
