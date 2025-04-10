import 'package:flutter/material.dart';
import '../models/artical_model.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<NewsArticle> _articles = [];
  bool _isLoading = false;

  List<NewsArticle> get articles => _articles;
  bool get isLoading => _isLoading;

  NewsProvider() {
    fetchNews();
  }

  Future<void> fetchNews([String query = '']) async {
    _isLoading = true;
    notifyListeners();


    try{
      final data = await fetchnews(query);
      _articles = data;
    } catch(e){
      _articles = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
