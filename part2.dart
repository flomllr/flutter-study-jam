import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider(); 

          final index = i ~/ 2; 
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); 
          }
          return _buildRow(_suggestions[index]);
        });
  }
  
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }
    );
  }
  
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
           IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


// _________________________________________________________


// Replacement code for 'package:english_words/english_words.dart'
class WordPair {
  String word1;
  String word2;
  String asPascalCase;
  
  WordPair(this.word1, this.word2) {
    this.asPascalCase = 
      this.word1.toLowerCase() + 
      this.word2[0].toUpperCase() + 
      this.word2.substring(1).toLowerCase();
  }
}

class RandomWordPairIterator extends Iterator<WordPair> {
  WordPair current;
  final _random = new Random();
  bool moveNext() {
    final index1 = _random.nextInt(mostCommonAdjectives.length);
    final index2 = _random.nextInt(mostCommonNouns.length);
    final word1 = mostCommonAdjectives[index1];
    final word2 = mostCommonNouns[index2];
    this.current = WordPair(word1, word2);
    return true;
  }
}

class RandomWordPairIterable extends IterableMixin<WordPair> {
  final Iterator<WordPair> iterator;
  RandomWordPairIterable(this.iterator);
}

Iterable<WordPair> generateWordPairs() {
  final iterator = new RandomWordPairIterator();
  return RandomWordPairIterable(iterator);
}

List<String> mostCommonAdjectives = [
  'able',
  'bad',
  'best',
  'better',
  'big',
  'black',
  'certain',
  'clear',
  'different',
  'early',
  'easy',
  'economic',
  'federal',
  'free',
  'full',
  'good',
  'great',
  'hard',
  'high',
  'human',
  'important',
  'international',
  'large',
  'late',
  'little',
  'local',
  'long',
  'low',
  'major',
  'military',
  'national',
  'new',
  'old',
  'only',
  'other',
  'political',
  'possible',
  'public',
  'real',
  'recent',
  'right',
  'small',
  'social',
  'special',
  'strong',
  'sure',
  'true',
  'white',
  'whole',
  'young',
];

List<String> mostCommonNouns = [
    'area',
  'book',
  'business',
  'case',
  'child',
  'company',
  'country',
  'day',
  'eye',
  'fact',
  'family',
  'government',
  'group',
  'hand',
  'home',
  'job',
  'life',
  'lot',
  'man',
  'money',
  'month',
  'mother',
  'Mr',
  'night',
  'number',
  'part',
  'people',
  'place',
  'point',
  'problem',
  'program',
  'question',
  'right',
  'room',
  'school',
  'state',
  'story',
  'student',
  'study',
  'system',
  'thing',
  'time',
  'water',
  'way',
  'week',
  'woman',
  'word',
  'work',
  'world',
  'year',
];
