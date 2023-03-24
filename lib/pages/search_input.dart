import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/login/tabs/tabs_auth.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Taian',
    'Zambia'
  ];

  Future<void> signOutUser() async {
    try {
      final result = await Amplify.Auth.signOut().then((value) => null);
      safePrint(result);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Sleuth',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
          appBar: EasySearchBar(

              // isFloating: true,
              title: const Text('Search for Anagrams'),
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
              child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 100.0,
                  child: const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.deepPurple),
                      padding: EdgeInsets.all(8),
                      child: Text('Categories',
                          style: TextStyle(color: Colors.white))),
                ),
                ListTile(
                    textColor: Colors.black,
                    title: const Text('Item 1'),
                    onTap: () => {safePrint('Item 1')}),
                ListTile(
                    textColor: Colors.black,
                    title: const Text('Item 2'),
                    onTap: () => {safePrint('Item 2')}),
                ListTile(
                    textColor: Colors.black,
                    title: const Text('Item 3'),
                    onTap: () => {safePrint('Item 3')}),
                ListTile(
                    textColor: Colors.black,
                    title: const Text('Item 4'),
                    onTap: () => {safePrint('Item 4')}),
                ListTile(
                    textColor: Colors.black,
                    title: const Text('Item 5'),
                    onTap: () => {safePrint('Item 5')}),
                Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    ),
                    MaterialButton(
                      minWidth: double.tryParse('200'),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        signOutUser().then((value) => Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TabsAuth(title: 'Word Sleuth')),
                                (route) => false));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Center(child: Text('Signing Out...'))),
                        );
                      },
                      color: Colors.deepPurple,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
          body: Center(
              child: Text(
            'Value: $searchValue',
            style: const TextStyle(fontSize: 24),
          ))),
    );
  }
}
