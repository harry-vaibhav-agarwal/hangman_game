import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';


class RandomWordGenerator {
  Future generateSecretWord() async {
    List<dynamic> words;
    try {
      Uri uri = Uri.parse('https://api.datamuse.com/words?sp=${getRandomString(1)}*&max=10');
      Response response = await get(uri);
      words = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    return (words[Random().nextInt(words.length)]['word']).toUpperCase();
  }


  String getRandomString(int length) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random _rnd = Random();


    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }


  String generateDisplayWord(String word){


    String displayWord="";
    for(int i=0;i<word.length;i++){
        displayWord += "_";
    }

    return displayWord;
  }


  String addSpaces(String word){
    String result="";
    result += word[0];
    for(int i=1;i<word.length-1;i++)
      result += (' '+word[i]);

    if(word.length>1)
      result += ' '+ word[word.length-1];

    return result;
  }
}