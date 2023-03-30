import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/auth_wrapper.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:word_sleuth/models/ModelProvider.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  String name = '';
  String description = '';

  final _formKey = GlobalKey<FormState>();

  updateName(String value) {
    setState(() {
      name = value;
    });
  }

  updateDescription(String value) {
    setState(() {
      description = value;
    });
  }

  Future<void> createTodo(String name, String description) async {
    try {
      final todo = Todo(name: name, description: description);
      final request = ModelMutations.create(todo);
      final response = await Amplify.API.mutate(request: request).response;

      final createdTodo = response.data;
      if (createdTodo == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${createdTodo.name}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> updateTodo(Todo originalTodo) async {
    final todoWithNewName = originalTodo.copyWith(name: 'new name');

    final request = ModelMutations.update(todoWithNewName);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint('Response: $response');
  }

  Future<void> deleteTodo(Todo todoToDelete) async {
    final request = ModelMutations.delete(todoToDelete);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint('Response: $response');
  }

  Future<Todo?> queryItem(Todo queriedTodo) async {
    try {
      final request = ModelQueries.get(Todo.classType, queriedTodo.id);
      final response = await Amplify.API.query(request: request).response;
      final todo = response.data;
      if (todo == null) {
        safePrint('errors: ${response.errors}');
      }
      return todo;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return null;
    }
  }

  Future<List<Todo?>> queryListItems() async {
    try {
      final request = ModelQueries.list(Todo.classType);
      final response = await Amplify.API.query(request: request).response;

      final todos = response.data?.items;
      if (todos == null) {
        safePrint('errors: ${response.errors}');
        return <Todo?>[];
      }
      return todos;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
    return <Todo?>[];
  }

  static const limit = 100;

  Future<List<Todo?>> queryPaginatedListItems() async {
    final firstRequest = ModelQueries.list<Todo>(Todo.classType, limit: limit);
    final firstResult = await Amplify.API.query(request: firstRequest).response;
    final firstPageData = firstResult.data;

    // Indicates there are > 100 todos and you can get the request for the next set.
    if (firstPageData?.hasNextResult ?? false) {
      final secondRequest = firstPageData!.requestForNextResult;
      final secondResult =
          await Amplify.API.query(request: secondRequest!).response;
      return secondResult.data?.items ?? <Todo?>[];
    } else {
      return firstPageData?.items ?? <Todo?>[];
    }
  }

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
                title: const Text('Search Words and Names'),
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
                                      builder: (context) => const AuthWrapper(
                                          title: 'Word Sleuth')),
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
            body: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                Column(
                  children: [
                    Center(
                        child: Text(
                      'Value: $searchValue',
                      style: const TextStyle(fontSize: 24),
                    )),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    // ignore: prefer_const_constructors
                    Center(
                        child: const Text(
                      'Example create Todo',
                      style: TextStyle(fontSize: 24),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                              labelText: 'Name'),
                          keyboardType: TextInputType.text,
                          // The validator receives the text that the user has entered.
                          onChanged: ((value) => updateName(value))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              labelText: 'Description'),
                          keyboardType: TextInputType.text,
                          // The validator receives the text that the user has entered.
                          onChanged: ((value) => updateDescription(value))),
                    ),
                  ],
                ),
                MaterialButton(
                  minWidth: double.tryParse('340'),
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    createTodo(name, description);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Center(child: Text('Creating todo...'))),
                    );
                  },
                  color: Colors.deepPurple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text(
                    'Add Todo',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            )));
  }
}
