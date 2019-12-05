// Copy the following imports to the top of your file
import 'dart:collection';
import 'dart:math';

// Copy the following code to the end of your file in dartpad.dev
class WordPair {
  String word1;
  String word2;
  String asPascalCase;
  static final _random = new Random();
  
  WordPair(this.word1, this.word2) {
    this.asPascalCase = 
      this.word1.toLowerCase() + 
      this.word2[0].toUpperCase() + 
      this.word2.substring(1).toLowerCase();
  }
  
  static WordPair random() {
    final index1 = _random.nextInt(mostCommonAdjectives.length);
    final index2 = _random.nextInt(mostCommonNouns.length);
    final word1 = mostCommonAdjectives[index1];
    final word2 = mostCommonNouns[index2];
    return WordPair(word1, word2);
  }
}

class RandomWordPairIterator extends Iterator<WordPair> {
  WordPair current;
  final _random = new Random();
  bool moveNext() {
    this.current = WordPair.random();
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
