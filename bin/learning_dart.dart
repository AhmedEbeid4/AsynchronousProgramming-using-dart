import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

String BASE_URL = "https://v2.jokeapi.dev/joke/Programming";

void main(List<String> arguments) async {
  ask();
}

void ask() async {
  sleep(Duration(milliseconds: 500));
  print('\nDo you want a joke? (y/n)');
  String? qu = stdin.readLineSync();
  if(qu?.toLowerCase() == 'y'){
    await fetchJoke();
    ask();
  }else{
    print('Thank you');
  }
}

Future<dynamic> fetchJoke() async {
  var response = await http.get(Uri.parse(BASE_URL));
  var data = jsonDecode(response.body);
  var setup = data['setup'];
  var delivery = data['delivery'];
  var joke = data['joke'];

  if (joke == null) {
    print(setup);
    sleep(Duration(seconds: 1));
    print(delivery);
  } else {
    print(joke);
  }
}
