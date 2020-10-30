import 'package:explore_web/commons/constants.dart';
import 'package:explore_web/views/bottom/bottom_info_mobile_widget.dart';
import 'package:explore_web/views/bottom/bottom_info_web_widget.dart';
import 'package:explore_web/views/carousel/carousel_web_widget.dart';
import 'package:explore_web/views/header/app_bar_mobile_widget.dart';
import 'package:explore_web/views/header/app_bar_web_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _scrollPosition = 0.0;
  double _opacity = 0.0;

  ScrollController _scrollController;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < screenSize.height * 0.4
        ? _scrollPosition / (screenSize.height * 0.4)
        : 1.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000.0),
        child: screenSize.width > 800
            ? AppBarWebWidget(screenSize: screenSize, opacity: _opacity)
            : AppBarMobileWidget(screenSize: screenSize, opacity: _opacity),
      ),
      backgroundColor: Colors.white,
      body: _buildBody(context, screenSize),
    );
  }

  Widget _buildBody(BuildContext context, Size screenSize) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenSize.width > 800
                    ? screenSize.height * 0.52
                    : screenSize.height * 0.75,
              ),
              Container(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'images/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              screenSize.width > 800
                  ? Positioned(
                      top: screenSize.height * 0.40,
                      left: screenSize.width * 0.22,
                      right: screenSize.width * 0.22,
                      child: Card(
                        elevation: 5.0,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenSize.width * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Destination',
                                style: kFloatingBarButton,
                              ),
                              Container(
                                height: 40.0,
                                width: 0.5,
                                color: Colors.blueGrey.withOpacity(0.3),
                              ),
                              Text(
                                'Dates',
                                style: kFloatingBarButton,
                              ),
                              Container(
                                height: 40.0,
                                width: 0.5,
                                color: Colors.blueGrey.withOpacity(0.3),
                              ),
                              Text(
                                'People',
                                style: kFloatingBarButton,
                              ),
                              Container(
                                height: 40.0,
                                width: 0.5,
                                color: Colors.blueGrey.withOpacity(0.3),
                              ),
                              Text(
                                'Experience',
                                style: kFloatingBarButton,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      top: screenSize.height * 0.415,
                      left: screenSize.width * 0.15,
                      right: screenSize.width * 0.15,
                      child: Column(
                        children: [
                          Card(
                            elevation: 5.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dates',
                                          style: kFloatingBarButton,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'People',
                                          style: kFloatingBarButton,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.02),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.wb_sunny,
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Experience',
                                          style: kFloatingBarButton,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.blueGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Destination',
                                          style: kFloatingBarButton,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.03,
                vertical: screenSize.width * 0.03),
            child: SizedBox(
              width: screenSize.width,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text('Featured', style: kHeader1Bold),
                  Text('Unique wildlife tours and destinations',
                      style: kHeader5),
                ],
              ),
            ),
          ),
          screenSize.width > 800
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: screenSize.width * 0.17,
                            width: screenSize.width * 0.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'images/trekking.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Trekking', style: kHeader4Bold),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: screenSize.width * 0.17,
                            width: screenSize.width * 0.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'images/animals.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Animals', style: kHeader4Bold),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: screenSize.width * 0.17,
                            width: screenSize.width * 0.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.01),
                              child: Image.asset(
                                'images/photography.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Photography', style: kHeader4Bold),
                        ],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.03,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width * 0.3,
                              width: screenSize.width * 0.55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'images/trekking.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Trekking', style: kHeader4Bold),
                          ],
                        ),
                        SizedBox(width: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width * 0.3,
                              width: screenSize.width * 0.55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'images/animals.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Animals', style: kHeader4Bold),
                          ],
                        ),
                        SizedBox(width: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width * 0.3,
                              width: screenSize.width * 0.55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 0.01),
                                child: Image.asset(
                                  'images/photography.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Photography', style: kHeader4Bold),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 70.0),
          Text(
            'Destination Diversity',
            style: kHeader2Bold,
          ),
          SizedBox(height: 8.0),
          CarouselWebWidget(screenSize: screenSize),
          SizedBox(height: 16.0),
          screenSize.width > 800
              ? BottomInfoWebWidget()
              : BottomInfoMobileWidget(),
        ],
      ),
    );
  }
}
