//  SizedBox(
//                             width: double.infinity,
//                             child: Text(
//                               textAlign: TextAlign.center,
//                               '$ayah',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                                 wordSpacing: 2,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'Quran',
//                               ),
//                             ),
//                           )

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran_api/services/quran_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;

  final ImageProvider _assetsImage =
      const AssetImage('assets/images/mosque.jpg');
  ImageProvider _networkImage = const NetworkImage(
      'https://source.unsplash.com/random/?quran,mosque,prayer,nature,rivers,tree,Flower,islamic,star,/?orientation=portrait');

  String? ayah;
  QuranModel quranModel = QuranModel();

  void getImage() {
    _networkImage
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((image, synchronousCall) {
      setState(() {
        isLoaded = true;
      });
    }));
  }

  @override
  void initState() {
    getImage();
    getAyah();
    super.initState();
  }

  getAyah() {
    quranModel.getRandomAyah().then((value) {
      ayah = value;
      setState(() {});
    });
  }

  changeImageAndImage() {
    setState(() {
      getImage();
      getAyah();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: changeImageAndImage,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: !isLoaded ? _assetsImage : _networkImage,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.1),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  // color: Colors.white.withOpacity(0.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ayah != null
                          ? Text(
                              '$ayah',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                height: 1.8,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quran',
                              ),
                            )
                          : const Text(
                              'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quran',
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
