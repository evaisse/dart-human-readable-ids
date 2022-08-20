import 'dart:math';

const _defaultNouns = [
  "ape",
  "baboon",
  "badger",
  "bat",
  "bear",
  "bird",
  "bobcat",
  "bulldog",
  "bullfrog",
  "cat",
  "catfish",
  "cheetah",
  "chicken",
  "chipmunk",
  "cobra",
  "cougar",
  "cow",
  "crab",
  "deer",
  "dingo",
  "dodo",
  "dog",
  "dolphin",
  "donkey",
  "dragon",
  "dragonfly",
  "duck",
  "eagle",
  "earwig",
  "eel",
  "elephant",
  "emu",
  "falcon",
  "fireant",
  "firefox",
  "fish",
  "fly",
  "fox",
  "frog",
  "gecko",
  "goat",
  "goose",
  "grasshopper",
  "horse",
  "hound",
  "husky",
  "impala",
  "insect",
  "jellyfish",
  "kangaroo",
  "ladybug",
  "liger",
  "lion",
  "lionfish",
  "lizard",
  "mayfly",
  "mole",
  "monkey",
  "moose",
  "moth",
  "mouse",
  "mule",
  "newt",
  "octopus",
  "otter",
  "owl",
  "panda",
  "panther",
  "parrot",
  "penguin",
  "pig",
  "puma",
  "pug",
  "quail",
  "rabbit",
  "rat",
  "rattlesnake",
  "robin",
  "seahorse",
  "sheep",
  "shrimp",
  "skunk",
  "sloth",
  "snail",
  "snake",
  "squid",
  "starfish",
  "stingray",
  "swan",
  "termite",
  "tiger",
  "treefrog",
  "turkey",
  "turtle",
  "vampirebat",
  "walrus",
  "warthog",
  "wasp",
  "wolverine",
  "wombat",
  "yak",
  "zebra",
];

const _defaultAdjectives = [
  "afraid",
  "ancient",
  "angry",
  "average",
  "bad",
  "big",
  "bitter",
  "black",
  "blue",
  "brave",
  "breezy",
  "bright",
  "brown",
  "calm",
  "chatty",
  "chilly",
  "clever",
  "cold",
  "cowardly",
  "cuddly",
  "curly",
  "curvy",
  "dangerous",
  "dry",
  "dull",
  "empty",
  "evil",
  "fast",
  "fat",
  "fluffy",
  "foolish",
  "fresh",
  "friendly",
  "funny",
  "fuzzy",
  "gentle",
  "giant",
  "good",
  "great",
  "green",
  "grumpy",
  "happy",
  "hard",
  "heavy",
  "helpless",
  "honest",
  "horrible",
  "hot",
  "hungry",
  "itchy",
  "jolly",
  "kind",
  "lazy",
  "light",
  "little",
  "loud",
  "lovely",
  "lucky",
  "massive",
  "mean",
  "mighty",
  "modern",
  "moody",
  "nasty",
  "neat",
  "nervous",
  "new",
  "nice",
  "odd",
  "old",
  "orange",
  "ordinary",
  "perfect",
  "pink",
  "plastic",
  "polite",
  "popular",
  "pretty",
  "proud",
  "purple",
  "quick",
  "quiet",
  "rare",
  "red",
  "rotten",
  "rude",
  "selfish",
  "serious",
  "shaggy",
  "sharp",
  "short",
  "shy",
  "silent",
  "silly",
  "slimy",
  "slippery",
  "smart",
  "smooth",
  "soft",
  "sour",
  "spicy",
  "splendid",
  "spotty",
  "stale",
  "strange",
  "strong",
  "stupid",
  "sweet",
  "swift",
  "tall",
  "tame",
  "tasty",
  "tender",
  "terrible",
  "thin",
  "tidy",
  "tiny",
  "tough",
  "tricky",
  "ugly",
  "unlucky",
  "warm",
  "weak",
  "wet",
  "white",
  "wicked",
  "wise",
  "witty",
  "wonderful",
  "yellow",
  "young",
];

///
/// Generate ids in the format of adjective-noun-# such as
///       silly-goose-37
///       quick-cobra-15
///       tricky-chicken-23
///       brave-ladybug-90
///
/// @license https://git.coolaj86.com/coolaj86/human-readable-ids.js/src/branch/master/LICENSE
/// @see https://www.npmjs.com/package/human-readable-ids
class HumanReadableIdGenerator {
  final int _numericIdsRange;
  final List<String>? _adjectives;
  final List<String>? _nouns;
  final Random _seed;

  ///
  /// The generated id will follow the format : adjective-noun-#
  /// Nouns can be a list a string
  factory HumanReadableIdGenerator(
      {int? numericIdsRange, List<String>? adjectives, List<String>? nouns, Random? seed}) {
    if (adjectives != null) assert(adjectives.isNotEmpty);
    if (nouns != null) assert(nouns.isNotEmpty);
    return HumanReadableIdGenerator._(
      seed ?? Random(),
      adjectives,
      nouns,
      numericIdsRange ?? 100,
    );
  }

  HumanReadableIdGenerator._(this._seed, this._adjectives, this._nouns, this._numericIdsRange);

  String generate() {
    final a = _adjectives ?? _defaultAdjectives;
    final b = _nouns ?? _defaultNouns;
    return [
      a[_seed.nextInt(a.length)],
      b[_seed.nextInt(b.length)],
      "${_seed.nextInt(_numericIdsRange)}",
    ].join('-');
  }
}

HumanReadableIdGenerator? _generator;

String humanReadableId() {
  return (_generator ??= HumanReadableIdGenerator()).generate();
}
