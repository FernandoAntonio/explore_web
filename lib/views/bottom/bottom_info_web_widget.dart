import 'package:explore_web/commons/constants.dart';
import 'package:flutter/material.dart';

class BottomInfoWebWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      color: Colors.blueGrey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About'.toUpperCase(),
                          style: kHeader4Bold.copyWith(color: Colors.blueGrey),
                        ),
                        Text(
                          'Contact Us',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'About Us',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'Carrers',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Help'.toUpperCase(),
                          style: kHeader4Bold.copyWith(color: Colors.blueGrey),
                        ),
                        Text(
                          'Payment',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'Cancellation',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'FAQ',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Social'.toUpperCase(),
                          style: kHeader4Bold.copyWith(color: Colors.blueGrey),
                        ),
                        Text(
                          'Twitter',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'Facebook',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                        Text(
                          'YouTube',
                          style: kHeader5.copyWith(color: Colors.blueGrey[200]),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.blueGrey,
                      indent: 16.0,
                      endIndent: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Email: ',
                              style: kHeader5.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              'explorer@gmail.com',
                              style: kHeader5.copyWith(
                                  color: Colors.blueGrey[200]),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Address: ',
                              style: kHeader5.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              'Flora Ave Zephyrhills, Florida FL',
                              style: kHeader5.copyWith(
                                  color: Colors.blueGrey[200]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            SizedBox(height: 25.0),
            Text(
              'Copyright © 2020 | Explore',
              style: kHeader5Bold.copyWith(color: Colors.blueGrey),
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
