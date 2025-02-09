import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/item_model.dart';

import '../../load_json.dart';

void main() async {
  final itemJson = await loadJson('test/json/item.json');
  group('ItemModel =>', () {
    test('should correctly deserialize from JSON', () {
      final item = ItemModel.fromJson(itemJson);

      expect(item.name, 'ducha dupla');
    });
  });
}
