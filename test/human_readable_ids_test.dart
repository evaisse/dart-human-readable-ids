import 'package:human_readable_ids/human_readable_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Test some basic properties of the generator', () {
    test('Ensure IDs are distinct', () {
      var a = HumanReadableIdGenerator().generate();
      var b = HumanReadableIdGenerator().generate();
      expect(a != b, true);
    });
    test('First Test', () {
      var stupidGenerator = HumanReadableIdGenerator(
        numericIdsRange: 1,
        nouns: ["john"],
        adjectives: ['genius'],
      );
      var id = stupidGenerator.generate();
      expect(id, 'genius-john-0');
      expect(stupidGenerator.generate(), id);
    });
  });
}
