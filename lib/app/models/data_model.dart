import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required int page,
    required int itemsPerPage,
    required int totalSuites,
    required int totalMotels,
    required double radius,
    required double maxPages,
    required List<MotelModel> motels,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
