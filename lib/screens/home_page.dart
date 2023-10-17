import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/data/image_path.dart';
import 'package:wheather_app/services/location_provider.dart';
import 'package:wheather_app/utils/apptext.dart';

import '../utils/custom_divider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isClicked = false;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locationprovider = Provider.of<LocationProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 65, bottom: 20, left: 20, right: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(background[0]))),
        child: Stack(children: [
          _isClicked == true
              ? Positioned(
                  top: 90,
                  left: 20,
                  right: 20,
                  child: Container(
                    color: Colors.red,
                    height: 45,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Container(
            height: 60,
            child: Consumer<LocationProvider>(
              builder: (context, locationprovider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              data: locationprovider
                                      .currentLocationName!.locality!.isEmpty
                                  ? "Unknown location"
                                  : locationprovider
                                      .currentLocationName!.locality,
                              size: 18,
                              fw: FontWeight.bold,
                              color: Colors.white,
                            ),
                            AppText(
                              data: "Good Morning",
                              size: 14,
                              fw: FontWeight.bold,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ]),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isClicked = !_isClicked;
                          });
                        },
                        icon: Icon(
                          Icons.search,
                          size: 32,
                        ))
                  ]),
            ),
          ),
          Align(
              alignment: Alignment(0, -0.7),
              child: Image(image: AssetImage(imagePath[0]))),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              height: 130,
              width: 190,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      data: "23.0 C",
                      color: Colors.white,
                      fw: FontWeight.bold,
                      size: 32,
                    ),
                    AppText(
                      data: "Snow",
                      color: Colors.white,
                      fw: FontWeight.w600,
                      size: 26,
                    ),
                    AppText(
                      data: DateTime.now().toString(),
                      color: Colors.white,
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.75),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.4)),
              height: 180,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/temperature-high.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Temp Max",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                                AppText(
                                  data: "23.0 C",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/temperature-low.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Temp Min",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                                AppText(
                                  data: "23.0 C",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    CustomDivider(
                      startIndent: 20,
                      endIndent: 20,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/sun.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Sun Rise",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                                AppText(
                                  data: "23.0 C",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/moon.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: "Sun set",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                                AppText(
                                  data: "23.0 C",
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
