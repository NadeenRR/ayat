import 'package:flutter/material.dart';
import 'package:quran_api/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:math';

// int randomSurah = Random().nextInt(114) + 1; // 92

// Future<int> getTotalAyahs() async {
//   final response = await http
//       .get(Uri.parse('https://api.quran.gading.dev/surah/$randomSurah'));
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     print("${data['data']['numberOfVerses']} nadeen");
//     print("${data['data']['name']['long']} rad");
//     return data['data']['numberOfVerses'];
//   }
//   return Future.error('something wrong');
// }

// Future<Map<String, dynamic>> generateRandomAyah() async {
//   //  await Future.delayed(Duration(seconds: 3));
//   final totalAyahs = await getTotalAyahs(); // 123
//   final randomAyahNumber = Random().nextInt(totalAyahs);

//   final response = await http.get(Uri.parse(
//       'https://api.quran.gading.dev/surah/$randomSurah/$randomAyahNumber'));
//   // final data = jsonDecode(response.body);
//   // print('${data['data']['text']['arab']} ddd');
//   // return data['data']['text']['arab'];

//   if (response.statusCode == 200) {
//     //   Map<String, dynamic> data = jsonDecode(response.body);
//     // print(response.body);
//     return jsonDecode(response.body);
//   }
//   return Future.error('something wrong');
// }

// // Usage
// void main() async {
//   Map<String, dynamic> surahInfo = await generateRandomAyah();
//   String ayah = surahInfo['data']['text']['arab'];
//   print(ayah);
// }
