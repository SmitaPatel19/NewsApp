import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/utils/api_key.dart';

import '../models/artical_model.dart';

Future<List<NewsArticle>> fetchnews(String query) async {
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?language=en&pageSize=100&apiKey=${APIKey.apikey}&q=$query',
    ),
  );

  Map result = jsonDecode(response.body);
  print('Fetched News');

  return (result['articles'] as List)
      .map((e) => NewsArticle.fromJson(e))
      .toList();
}
