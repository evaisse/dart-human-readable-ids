import 'package:human_readable_ids/human_readable_ids.dart';

void main() async {
  /// short hand
  print('id: ${humanReadableId()}');

  /// Longer version
  var generator = HumanReadableIdGenerator();
  print('id: ${generator.generate()}');
  print('id: ${generator.generate()}');

  /// customize the generator
  var stupidGenerator = HumanReadableIdGenerator(
    numericIdsRange: 1,
    nouns: ["john"],
    adjectives: ['genius'],
  );

  print('id: ${stupidGenerator.generate()}');
  assert(stupidGenerator.generate() == stupidGenerator.generate());
}
