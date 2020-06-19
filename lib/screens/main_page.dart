import 'package:flutter/material.dart';
import 'package:movieapp/component/Listview/popular.dart';
import 'package:movieapp/component/Listview/toprated.dart';
import 'package:movieapp/component/Listview/trending.dart';
import 'package:movieapp/component/Listview/upcoming.dart';
import 'package:movieapp/component/search_engine.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
