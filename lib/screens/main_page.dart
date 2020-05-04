import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/Listviw/popular.dart';
import 'package:movieapp/component/Listviw/toprated.dart';
import 'package:movieapp/component/Listviw/trending.dart';
import 'package:movieapp/component/Listviw/upcoming.dart';
import 'package:movieapp/component/search_engine.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModule>(
      create: (BuildContext context) => AppModule(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SearchEngine(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    UpComing(),
                    Trending(),
                    TopRated(),
                    Popular(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
