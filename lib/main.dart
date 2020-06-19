import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
AppModule data = AppModule();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModule>(
      create: (BuildContext context) => AppModule(),
      child: MaterialApp(
        title: 'TMBD',
        home: MainPage(),
      ),
    );
  }
}
