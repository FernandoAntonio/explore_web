import 'package:explore_web/commons/constants.dart';
import 'package:flutter/material.dart';

class AppBarMobileWidget extends StatefulWidget {
  AppBarMobileWidget({
    @required this.screenSize,
    @required this.opacity,
  });

  final Size screenSize;
  final double opacity;

  @override
  _AppBarMobileWidgetState createState() => _AppBarMobileWidgetState();
}

class _AppBarMobileWidgetState extends State<AppBarMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800].withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Explore'.toUpperCase(),
                textAlign: TextAlign.center,
                style: kAppBarTitle.copyWith(color: Colors.grey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
