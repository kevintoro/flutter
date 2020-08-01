import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:example_words/views/randomWords.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF333333),
        brightness: Brightness.dark,
        accentColor: Colors.red[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'English Words'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final random = RandomWords();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => _pushSaved(context, random),
          )
        ],
      ),
      body: Center(
        child: random,
      ),
    );
  }

  void _pushSaved(BuildContext context, RandomWords random) {
    final _biggerFont = const TextStyle(fontSize: 18);
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) {
        final tiles = random.saved.map((WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });
        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return Scaffold(
          appBar: AppBar(
            title: Text("Saved Sugestions"),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }
}
