import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      child: Tab(
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
