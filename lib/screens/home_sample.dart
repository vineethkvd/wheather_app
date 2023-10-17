import 'package:flutter/material.dart';

import '../data/image_path.dart';
import '../utils/apptext.dart';

class HomeSample extends StatefulWidget {
  const HomeSample({super.key});

  @override
  State<HomeSample> createState() => _HomeSampleState();
}

class _HomeSampleState extends State<HomeSample> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(background[0]))),
        child: Stack(children: [
          Align(
            alignment: Alignment(-0.8,-0.9),
            child: Container(
              height: 42,
              width: 200,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                    Container(
                      child: Column(children: [
                        AppText(
                          data: "Dubai",
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
                      ],),
                    ),
                    IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.search,
                          size: 32,
                        ))
              ]),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Image(image: AssetImage(imagePath[0])),
          )
        ]),
      ),
    );
  }
}
