import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';

import '../../load_json.dart';

void main() async {
  final suiteJson = await loadJson('test/json/suite.json');

  group('SuiteModel =>', () {
    test('should correctly deserialize from JSON', () {
      final suite = SuiteModel.fromJson(suiteJson);

      expect(suite.name, 'Suíte Marselha s/ garagem privativa');
      expect(suite.quantity, 1);
      expect(suite.showAvailableQuantity, true);
      expect(suite.photos, isNotEmpty);
      expect(suite.items, isEmpty);
      expect(suite.categoryItems, isEmpty);
      expect(suite.periods, isEmpty);
    });

    test('should correctly handle the period getter', () {
      final suite = SuiteModel.fromJson(suiteJson);
      final (period, hasDiscount) = suite.period;

      expect(period, isNull);
      expect(hasDiscount, isFalse);
    });
  });
}
