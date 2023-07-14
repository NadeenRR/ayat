// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class QuranApi {
  int randomSurah = Random().nextInt(114) + 1; // 92

  Future<int> getTotalAyahs() async {
    final response = await http
        .get(Uri.parse('https://api.quran.gading.dev/surah/$randomSurah'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("${data['data']['numberOfVerses']} nadeen");
      print("${data['data']['name']['long']} rad");
      return data['data']['numberOfVerses'];
    }
    return Future.error('something wrong');
  }

  Future<Map<String, dynamic>> generateRandomAyah() async {
    final totalAyahs = await getTotalAyahs(); // 123
    final randomAyahNumber = Random().nextInt(totalAyahs);

    final response = await http.get(Uri.parse(
        'https://api.quran.gading.dev/surah/$randomSurah/$randomAyahNumber'));
    // final data = jsonDecode(response.body);
    // print('${data['data']['text']['arab']} ddd');
    // return data['data']['text']['arab'];

    if (response.statusCode == 200) {
      //   Map<String, dynamic> data = jsonDecode(response.body);
      print(response.body);
      return jsonDecode(response.body);
    }
    return Future.error('something wrong');
  }
}
