import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/discount_model.dart';

import '../../load_json.dart';

void main() async {
  final discountJson = await loadJson('test/json/discount.json');

  group('DiscountModel =>', () {
    test('should correctly deserialize from JSON', () {
      final discount = DiscountModel.fromJson(discountJson);

      expect(discount.amount, 48.0);
    });
  });
}
