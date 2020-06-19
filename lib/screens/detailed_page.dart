import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/Listview/recommended.dart';
import 'package:movieapp/component/Listview/similar.dart';
import 'package:movieapp/component/detailed_card.dart';
import 'package:provider/provider.dart';

class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<AppModule>(context).isBusy
          ? busy()
          : SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        DetailedCard(),
                        SizedBox(
                          height: 8,
                        ),
                        Recommended(),
                        Similar(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget busy() {
    return Center(child: CircularProgressIndicator());
  }
}
