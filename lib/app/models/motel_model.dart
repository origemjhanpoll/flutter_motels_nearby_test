import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'motel_model.freezed.dart';
part 'motel_model.g.dart';

@freezed
class MotelModel with _$MotelModel {
  const factory MotelModel({
    required String name,
    required String logo,
    required String neighborhood,
    required double distance,
    required int favoritesCount,
    required List<SuiteModel> suites,
    required int reviewsCount,
    required double rating,
  }) = _MotelModel;

  factory MotelModel.fromJson(Map<String, dynamic> json) =>
      _$MotelModelFromJson(json);
}
