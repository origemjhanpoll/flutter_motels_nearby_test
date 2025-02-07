import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'motel_model.freezed.dart';
part 'motel_model.g.dart';

@freezed
class MotelModel with _$MotelModel {
  const MotelModel._();

  const factory MotelModel({
    @JsonKey(name: 'fantasia') required String name,
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'bairro') required String neighborhood,
    @JsonKey(name: 'distancia') required double distance,
    @JsonKey(name: 'qtdFavoritos') required int favoritesCount,
    @JsonKey(name: 'suites') required List<SuiteModel> suites,
    @JsonKey(name: 'qtdAvaliacoes') required int reviewsCount,
    @JsonKey(name: 'media') required double rating,
  }) = _MotelModel;

  factory MotelModel.fromJson(Map<String, dynamic> json) =>
      _$MotelModelFromJson(json);

  List<String> get firstPhotos {
    return suites
        .map((suite) => suite.photos.isNotEmpty ? suite.photos.first : null)
        .whereType<String>()
        .toList();
  }
}
