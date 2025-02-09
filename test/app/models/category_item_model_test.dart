import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';

import '../../load_json.dart';

void main() async {
  final categoryItemJson = await loadJson('test/json/category_item.json');

  group('CategoryItemModel =>', () {
    test('should correctly deserialize from JSON', () {
      final categoryItem = CategoryItemModel.fromJson(categoryItemJson);

      expect(categoryItem.name, 'Frigobar');
      expect(categoryItem.icon,
          'https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png');
    });
  });
}
