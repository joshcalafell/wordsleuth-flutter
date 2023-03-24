import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/login/tabs/tabs_auth.dart';

class PagePicsList extends StatelessWidget {
  const PagePicsList({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images List'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
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
              })
        ],
      ),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: ListTile(
              title: Text('Image ${index + 1}'),
              leading: Hero(
                tag: index,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 8, 2, 0),
                  child: Image.network(_images[index],
                      width: 100, fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PagePicsListDetail(
                        pictureIndex: index, title: 'Image ${index + 1}')));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Sign Out',
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.search)),
    );
  }
}

class PagePicsListDetail extends StatelessWidget {
  final int pictureIndex;
  final String title;
  const PagePicsListDetail(
      {super.key, required this.pictureIndex, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Hero(
                  tag: pictureIndex,
                  child: Image.network(_images[pictureIndex]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Content goes here...",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}

final List<String> _images = [
  'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];
