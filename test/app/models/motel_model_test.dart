import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';

import '../../load_json.dart';

void main() async {
  final motelJson = await loadJson('test/json/motel.json');

  group('MotelModel =>', () {
    test('should correctly deserialize from JSON', () {
      final motel = MotelModel.fromJson(motelJson);

      expect(motel.name, 'Motel Le Nid');
      expect(motel.logo,
          'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif');
      expect(motel.neighborhood, 'Chácara Flora - São Paulo');
      expect(motel.distance, 28.27);
      expect(motel.favoritesCount, 0);
      expect(motel.suites, isEmpty);
      expect(motel.reviewsCount, 2159);
      expect(motel.rating, 4.6);
    });
  });
}
