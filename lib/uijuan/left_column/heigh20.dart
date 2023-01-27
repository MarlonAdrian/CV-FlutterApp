import 'package:flutter/cupertino.dart';

class Height20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20 * 1,
    );
  }
}
