import 'dart:convert' as convert;

import 'package:user_app/model/user_details_model_class.dart';
import 'package:http/http.dart' as http;

//class Fetchdataclass {
Future<List<UserDetails>?> fetchedDetails() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List<dynamic> list = convert.jsonDecode(response.body);
    List<UserDetails> details =
        list.map((e) => UserDetails.fromJson(e)).toList();

    return details;
  } else {
    throw Exception('error');
  }
}
//}
