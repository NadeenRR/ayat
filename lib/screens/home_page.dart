import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran_api/services/quran_model.dart';

import '../services/quran.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  final ImageProvider _assetsImage =
      const AssetImage('assets/images/mosque.jpg');
  final ImageProvider _networkImage = const NetworkImage(
      'https://source.unsplash.com/random/?quran,mosque,prayer,nature,rivers,islamic/?orientation=portrait');

  QuranModel quranModel = QuranModel();
//  late String surah;
  late String ayah;
//  late int numberOfAyah;

  // void updateUi() {
  //   // surah = quranModel.surah;
  //   ayah = quranModel.ayah;
  //   // numberOfAyah = quranModel.numberOfAyah;
  // }

  QuranApi quranApi = QuranApi();

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
    print('ddd');
    ayah = quranModel.ayah;
    // updateUi();
    print('aaa');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String getAyah() {
      if (ayah.isNotEmpty) {
        return ayah;
      } else {
        return 'بسم الله الرحمن الرحيم';
      }
    }

    return Scaffold(
      body: Stack(children: [
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
                    Text(
                      getAyah(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
