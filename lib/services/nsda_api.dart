import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sunnah_diet/models/foods/bastard_model.dart';
import 'package:sunnah_diet/models/search_model.dart';
import 'package:sunnah_diet/config/env.dart';

Future<FoodSearch> searchFood(String query) async {
  final key = Env.instance.fdcApiKey;
  var url = Uri.parse(
      "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$key&query=$query");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return FoodSearch.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load food data');
  }
}

Future<BrandedFood> fetchData(String id) async {
  final key = Env.instance.fdcApiKey;
  var url = Uri.parse("https://api.nal.usda.gov/fdc/v1/food/$id?api_key=$key");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(response.body);
    return BrandedFood.fromJson(decodedResponse);
  } else {
    throw Exception('Failed to load data');
  }
}
