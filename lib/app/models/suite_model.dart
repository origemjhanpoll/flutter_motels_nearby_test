import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suite_model.freezed.dart';
part 'suite_model.g.dart';

@freezed
class SuiteModel with _$SuiteModel {
  const factory SuiteModel({
    required String name,
    required int quantity,
    required bool showAvailableQuantity,
    required List<String> photos,
    required List<ItemModel> items,
    required List<CategoryItemModel> categoryItems,
    required List<PeriodModel> periods,
  }) = _SuiteModel;

  factory SuiteModel.fromJson(Map<String, dynamic> json) =>
      _$SuiteModelFromJson(json);
}
