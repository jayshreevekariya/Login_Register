import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key key,
    this.dividerHeight: 50,
  }) : super(key: key);

  final double dividerHeight;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: dividerHeight,
      thickness: 1,
      color: Colors.grey,
    );
  }
}
