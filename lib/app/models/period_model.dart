import 'package:flutter_motels_nearby_test/app/models/discount_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_model.freezed.dart';
part 'period_model.g.dart';

@freezed
class PeriodModel with _$PeriodModel {
  const factory PeriodModel({
    required String formattedTime,
    required String time,
    required double price,
    required double totalPrice,
    required bool hasCourtesy,
    DiscountModel? discount,
  }) = _PeriodModel;

  factory PeriodModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodModelFromJson(json);
}
