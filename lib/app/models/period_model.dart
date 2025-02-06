import 'package:flutter_motels_nearby_test/app/models/discount_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_model.freezed.dart';
part 'period_model.g.dart';

@freezed
class PeriodModel with _$PeriodModel {
  const factory PeriodModel({
    @JsonKey(name: 'tempoFormatado') required String formattedTime,
    @JsonKey(name: 'tempo') required String time,
    @JsonKey(name: 'valor') required double price,
    @JsonKey(name: 'valorTotal') required double totalPrice,
    @JsonKey(name: 'temCortesia') required bool hasCourtesy,
    @JsonKey(name: 'desconto') DiscountModel? discount,
  }) = _PeriodModel;

  factory PeriodModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodModelFromJson(json);
}
