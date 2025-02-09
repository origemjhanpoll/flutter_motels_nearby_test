import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';

import '../../load_json.dart';

void main() async {
  final periodJson = await loadJson('test/json/period.json');

  group('PeriodModel =>', () {
    test('should correctly deserialize from JSON', () {
      final period = PeriodModel.fromJson(periodJson);

      expect(period.formattedTime, '3 horas');
      expect(period.time, '3');
      expect(period.price, 88.0);
      expect(period.totalPrice, 88.0);
      expect(period.hasCourtesy, false);
      expect(period.discount, isNull);
    });
  });
}
