import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Sleuth',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
          appBar: EasySearchBar(
              title: const Center(child: Text('Serach for Anagrams')),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              openOverlayOnSearch: true,
              onSearch: (value) => setState(() => {
                    if (value == '')
                      {searchValue = searchValue}
                    else
                      {searchValue = value}
                  }),
              suggestions: _suggestions),
          drawer: Drawer(
              child: ListView(padding: const EdgeInsets.all(0), children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Pages',
              ),
            ),
            ListTile(
                textColor: Colors.black,
                title: const Text('Item 1'),
                onTap: () => {}),
            ListTile(
                textColor: Colors.black,
                title: const Text('Item 2'),
                onTap: () => {}),
          ])),
          body: Center(
              child: Text(
            'Value: $searchValue',
            style: const TextStyle(fontSize: 24),
          ))),
    );
  }
}
