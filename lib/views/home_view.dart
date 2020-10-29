import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_web/commons/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<bool> _hoverAppBarList = [false, false, false, false];

  List<bool> _selectedPlacesList = [
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<String> _imagesList = [
    'images/asia.jpg',
    'images/africa.jpg',
    'images/europe.jpg',
    'images/south_america.jpg',
    'images/australia.jpg',
    'images/antarctica.jpg',
  ];

  List<String> _placesNameList = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  int _currentSelected = 0;
  double _scrollPosition = 0.0;
  double _opacity = 0.0;

  CarouselController _carouselController;
  ScrollController _scrollController;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselController();
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
        child: Container(
          color: Colors.blueGrey[800].withOpacity(_opacity),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.02),
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
                      SizedBox(width: screenSize.width * 0.03),
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
                      SizedBox(width: screenSize.width * 0.1),
                    ],
                  ),
                ),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: kAppBarButton.copyWith(
                      color:
                          _hoverAppBarList[2] ? Colors.white : Colors.grey[300],
                    ),
                  ),
                  onTap: () {},
                  onHover: (isHovering) {
                    setState(() {
                      _hoverAppBarList[2] = isHovering;
                    });
                  },
                ),
                SizedBox(width: screenSize.width * 0.02),
                InkWell(
                  child: Text(
                    'Login',
                    style: kAppBarButton.copyWith(
                      color:
                          _hoverAppBarList[3] ? Colors.white : Colors.grey[300],
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
        ),
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
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    'Destination',
                                    style: kFloatingBarButton,
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
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    'Dates',
                                    style: kFloatingBarButton,
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
                                  Icon(
                                    Icons.people,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    'People',
                                    style: kFloatingBarButton,
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
                                  Icon(
                                    Icons.wb_sunny,
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    'Experience',
                                    style: kFloatingBarButton,
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
                  Expanded(
                    child: Text('Unique wildlife tours and destinations',
                        style: kHeader5),
                  ),
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
          SizedBox(height: 10.0),
          _buildCarousel(context, screenSize),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, Size screenSize) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: List.generate(
              _imagesList.length,
              (index) => Padding(
                    padding: EdgeInsets.all(screenSize.width * 0.01),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.01),
                          child: Image.asset(
                            _imagesList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: screenSize.width * 0.07),
                            child: Text(
                              _placesNameList[index],
                              style: kPlacesTitle.copyWith(
                                  fontSize: screenSize.width * 0.07),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentSelected = index;
              });

              for (int i = 0; i < _imagesList.length; i++) {
                if (i == index) {
                  _selectedPlacesList[i] = true;
                } else {
                  _selectedPlacesList[i] = false;
                }
              }
            },
            initialPage: 0,
            disableCenter: true,
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
        ),
        screenSize.width > 800
            ? Positioned(
                bottom: screenSize.width * 0.095,
                left: screenSize.width * 0.2,
                right: screenSize.width * 0.2,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width * 0.01,
                      right: screenSize.width * 0.01,
                      bottom: screenSize.width * 0.01,
                      top: screenSize.width * 0.018,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        _imagesList.length,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              _carouselController.animateToPage(
                                index,
                                duration: Duration(seconds: 2),
                                curve: Curves.ease,
                              );
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                _placesNameList[index],
                                style: kHeader5.copyWith(
                                  color: Colors.blueGrey,
                                  fontSize: screenSize.width * 0.01,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _selectedPlacesList[index],
                                child: Container(
                                  color: Colors.blueGrey,
                                  height: 1.0,
                                  width: screenSize.width * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
