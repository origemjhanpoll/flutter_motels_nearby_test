import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    @JsonKey(name: 'pagina') required int page,
    @JsonKey(name: 'qtdPorPagina') required int itemsPerPage,
    @JsonKey(name: 'totalSuites') required int totalSuites,
    @JsonKey(name: 'totalMoteis') required int totalMotels,
    @JsonKey(name: 'raio') required double radius,
    @JsonKey(name: 'maxPaginas') required double maxPages,
    @JsonKey(name: 'moteis') required List<MotelModel> motels,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
