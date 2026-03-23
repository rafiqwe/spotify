import 'package:flutter/material.dart';

class MHeight extends StatelessWidget {
  final double? mHeight;
  const MHeight({super.key, this.mHeight = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: mHeight);
  }
}
