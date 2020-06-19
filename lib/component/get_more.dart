import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class GetMore extends StatelessWidget {
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: action,
          child: Container(
            width: KCardWidth,
            child: Center(
              child: Text(
                'Get More ...',
                style: TextStyle(color: Colors.blueAccent, fontSize: 29),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GetMore(this.action);
}
