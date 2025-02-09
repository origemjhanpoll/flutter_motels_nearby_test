import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/data_model.dart';

import '../../load_json.dart';

void main() async {
  final dataJson = await loadJson('test/json/data.json');

  group('DataModel =>', () {
    test('should correctly deserialize from JSON', () {
      final data = DataModel.fromJson(dataJson);

      expect(data.page, 1);
      expect(data.itemsPerPage, 10);
      expect(data.totalSuites, 0);
      expect(data.totalMotels, 1);
      expect(data.radius, 0);
      expect(data.maxPages, 1.0);
      expect(data.motels, isEmpty);
    });
  });
}
