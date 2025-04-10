import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/web_view_screen.dart';
import 'package:newsapp/utils/my_text.dart';
import 'package:newsapp/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import '../services/theme_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    final articles = provider.articles;
    final isLoading = provider.isLoading;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ThemeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          MySearchBar(onSearch: provider.fetchNews), // no changes
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : articles.isEmpty
                      ? Center(child: Text('No news found.'))
                      : RefreshIndicator(
                        onRefresh: () async {
                          await provider.fetchNews();
                        },
                        child: ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => WebViewPage(url: article.url),
                                    ),
                                  ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                  left: 5,
                                  right: 5,
                                  top: 5,
                                ),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: article.image ?? 'null',
                                      imageBuilder:
                                          (context, imageProvider) => Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).appBarTheme.backgroundColor,
                                            ),
                                          ),
                                      placeholder:
                                          (context, url) =>
                                              CircularProgressIndicator(
                                                color:
                                                    Theme.of(context)
                                                        .appBarTheme
                                                        .backgroundColor,
                                              ),
                                      errorWidget:
                                          (context, url, error) =>
                                              Icon(Icons.error),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ModifiedText(
                                            text: article.headline,
                                            size: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(height: 5),
                                          ModifiedText(
                                            text:
                                                article.description ??
                                                'No description available',
                                            size: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(height: 5),
                                          ModifiedText(
                                            text:
                                                '${article.sourceName} • ${article.publishedDate}',
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
