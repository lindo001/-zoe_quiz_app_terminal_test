// import 'package:http/http.dart' as http;
// import 'dart:ffi';
// import 'dart:io';
// import 'dart:js_interop';

import 'package:http/http.dart' as http;
import 'dart:convert';



final hidden = "iWhurQWlfvCeeoJrkcv5VXmsbDNQby0tTnSZErCJ";



class Httprequests {
  final int quizLimit;
  final String genre;
  Map<String, dynamic> holder = {};

  Httprequests(this.quizLimit, this.genre);

   List filterByIndex(Map answers) {
        int current_index = 0;
        List correctAnswerIndex = [];
        answers.entries.forEach((entry) {
          if (entry.value != null && entry.value != "false" ) {
            correctAnswerIndex.add(current_index.toString());
          }
          current_index++;
        });
        return correctAnswerIndex; 
  }
  Future<void> run() async {
    final String apiKey = "gkwNnVkBTMSCV8zBimvLyFl03I9uDy0TTCo87r6j";
    final Uri url = Uri.parse(
        "https://quizapi.io/api/v1/questions?apiKey=$apiKey&category=$genre");
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      for (var i = 0; i < jsonData.length; i++) {
        holder[i.toString()] = {"question": jsonData[i]["question"],
                      "correct_answers": jsonData[i]["answers"],
                      "possibleChoices": filterByIndex(jsonData[i]["correct_answers"])

        };

      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Map getResponse() {
    return holder;
  }
}



  

