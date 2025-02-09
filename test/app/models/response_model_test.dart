import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/response_model.dart';

import '../../load_json.dart';

void main() async {
  final responseJson = await loadJson('test/json/response.json');
  group('ResponseModel =>', () {
    test('should correctly deserialize from JSON', () {
      final response = ResponseModel.fromJson(responseJson);

      expect(response.success, true);
      expect(response.data.page, 1);
      expect(response.messages, isEmpty);
    });
  });
}
