import 'package:quran_api/services/quran.dart';

class QuranModel {
  //late String surah;
  late String ayah;
  // late int numberOfAyah;
  // late int numberAyahInSurah;

  Future<void> getRandomeAyah() async {
    Map<String, dynamic> surahInfo = await QuranApi().generateRandomAyah();

    ayah = surahInfo['data']['text']['arab'];

    // surah = surahInfo['data']['name']['long'];
    // numberOfAyah = surahInfo['data']['verses'][0]['number']['inQuran'];
    // ayah = surahInfo['data']["preBismillah"]["text"]["arab"];
    // numberAyahInSurah = surahInfo['data']['verses'][0]['number']['inSurah'];
  }
}
