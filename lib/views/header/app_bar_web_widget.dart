import 'package:explore_web/commons/constants.dart';
import 'package:flutter/material.dart';

class AppBarWebWidget extends StatefulWidget {
  AppBarWebWidget({
    @required this.screenSize,
    @required this.opacity,
  });

  final Size screenSize;
  final double opacity;

  @override
  _AppBarWebWidgetState createState() => _AppBarWebWidgetState();
}

class _AppBarWebWidgetState extends State<AppBarWebWidget> {
  List<bool> _hoverAppBarList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800].withOpacity(widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(widget.screenSize.width * 0.02),
        child: Row(
          children: [
            Text(
              'Explore'.toUpperCase(),
              style: kAppBarTitle.copyWith(color: Colors.grey[300]),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Discover',
                          style: kAppBarButton.copyWith(
                            color: _hoverAppBarList[0]
                                ? Colors.blue[100]
                                : Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Visibility(
                          visible: _hoverAppBarList[0],
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          child: Container(
                            height: 2.0,
                            width: 40.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                    onHover: (isHovering) {
                      setState(() {
                        _hoverAppBarList[0] = isHovering;
                      });
                    },
                  ),
                  SizedBox(width: widget.screenSize.width * 0.03),
                  InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Contact Us',
                          style: kAppBarButton.copyWith(
                            color: _hoverAppBarList[1]
                                ? Colors.blue[100]
                                : Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Visibility(
                          visible: _hoverAppBarList[1],
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          child: Container(
                            height: 2.0,
                            width: 40.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                    onHover: (isHovering) {
                      setState(() {
                        _hoverAppBarList[1] = isHovering;
                      });
                    },
                  ),
                  SizedBox(width: widget.screenSize.width * 0.1),
                ],
              ),
            ),
            InkWell(
              child: Text(
                'Sign Up',
                style: kAppBarButton.copyWith(
                  color: _hoverAppBarList[2] ? Colors.white : Colors.grey[300],
                ),
              ),
              onTap: () {},
              onHover: (isHovering) {
                setState(() {
                  _hoverAppBarList[2] = isHovering;
                });
              },
            ),
            SizedBox(width: widget.screenSize.width * 0.02),
            InkWell(
              child: Text(
                'Login',
                style: kAppBarButton.copyWith(
                  color: _hoverAppBarList[3] ? Colors.white : Colors.grey[300],
                ),
              ),
              onTap: () {},
              onHover: (isHovering) {
                setState(() {
                  _hoverAppBarList[3] = isHovering;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
