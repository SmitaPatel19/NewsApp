import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final Function(String) onSearch;
  const MySearchBar({super.key, required this.onSearch});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        widget.onSearch('');
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).appBarTheme.titleTextStyle!.color,
                        ),
                        border: InputBorder.none,
                        suffixIcon:
                            _searchController.text.isNotEmpty
                                ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color:
                                        Theme.of(
                                          context,
                                        ).appBarTheme.titleTextStyle!.color,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    widget.onSearch('');
                                    FocusScope.of(context).unfocus();
                                  },
                                )
                                : null,
                      ),
                      style: TextStyle(
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle!.color,
                      ),
                      onSubmitted: (value) {
                        widget.onSearch(value);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            widget.onSearch(_searchController.text);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.search,
              color: Theme.of(context).appBarTheme.titleTextStyle!.color,
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
