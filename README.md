Generate human-readable ids from a lists of nouns and adjectives. 

This is a port of [human-readable-ids-js](https://www.npmjs.com/package/human-readable-ids) for dart users.

## Features

Generate ids in the format of `adjective-noun-#` such as :

* silly-goose-37
* quick-cobra-15
* tricky-chicken-23
* brave-ladybug-90

Currently the id space is about 1,000,000 ids (100 adjectives * 100 nouns * 100 integer range).

## Usage

```dart
import 'package:human_readable_ids/human_readable_ids.dart';

void main() {
  print("id: ${humanReadableId()}");
}
```

Find more example in `/example` folder.

