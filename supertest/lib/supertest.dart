// import 'dart:ffi';
// import 'dart:io';

// import 'package:supertest/*';
// import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart';

import 'httpRequests.dart';



 
void runQuiz(String genre) async {
 Httprequests httprequests =  Httprequests(1,genre);
 await httprequests.run();
 final quizData = httprequests.getResponse();
  print("Quiz data loaded...");
//  print(quizData);
 
 // question
  quizData.entries.forEach((entry){
    print(entry.value["question"]);
    int so = 0;
    entry.value["correct_answers"].forEach((keys,vals){
      if (vals !=null){
        
        print(so.toString() +": " + vals);};
        so++;
    });
    print("\n What is your answer , pick by index");
    String? usersAnser = stdin.readLineSync();
    List vo = entry.value["possibleChoices"];
    (vo.contains(usersAnser))?print("correct"):print("wrong this answer was " + vo.toString());
  });
 // pos answers
 // correct ans

}


void main(List<String> args) {
  print("Welcom to the terminal version of the App \n\n choose one of the following Quiz topics(defualt is random): \n - Linux\n - DevOps\n - Docker" );
  String? genre = stdin.readLineSync();
  runQuiz(genre!);
}