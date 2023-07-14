import 'package:quran_api/services/quran.dart';

class QuranModel {
  //late String surah;
  String ayah = '';
  // late int numberOfAyah;
  // late int numberAyahInSurah;

  Future<void> getRandomeAyah() async {
    try {
      Map<String, dynamic> surahInfo = await QuranApi().generateRandomAyah();
      ayah = surahInfo['data']['text']['arab'];
    } on Exception catch (e) {
      print('Error: $e');
    }

    // surah = surahInfo['data']['name']['long'];
    // numberOfAyah = surahInfo['data']['verses'][0]['number']['inQuran'];
    // ayah = surahInfo['data']["preBismillah"]["text"]["arab"];
    // numberAyahInSurah = surahInfo['data']['verses'][0]['number']['inSurah'];
  }
}
