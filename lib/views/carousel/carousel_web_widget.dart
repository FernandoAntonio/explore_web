import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_web/commons/constants.dart';
import 'package:flutter/material.dart';

class CarouselWebWidget extends StatefulWidget {
  CarouselWebWidget({
    @required this.screenSize,
  });

  final Size screenSize;

  @override
  _CarouselWebWidgetState createState() => _CarouselWebWidgetState();
}

class _CarouselWebWidgetState extends State<CarouselWebWidget> {
  CarouselController _carouselController;

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

  List<bool> _selectedPlacesList = [
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int _currentSelected = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: List.generate(
            _imagesList.length,
            (index) => Padding(
              padding: EdgeInsets.all(widget.screenSize.width * 0.1),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(widget.screenSize.width * 0.01),
                    child: Image.asset(
                      _imagesList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: widget.screenSize.width * 0.04),
                      child: Text(
                        _placesNameList[index],
                        textAlign: TextAlign.center,
                        style: kPlacesTitle.copyWith(
                          fontSize: widget.screenSize.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        widget.screenSize.width > 800
            ? Positioned(
                bottom: widget.screenSize.width * 0.098,
                left: widget.screenSize.width * 0.25,
                right: widget.screenSize.width * 0.25,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widget.screenSize.width * 0.01,
                      right: widget.screenSize.width * 0.01,
                      bottom: widget.screenSize.width * 0.01,
                      top: widget.screenSize.width * 0.018,
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
                                  width: widget.screenSize.width * 0.03,
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
