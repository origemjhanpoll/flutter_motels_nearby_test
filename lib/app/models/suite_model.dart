import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'suite_model.freezed.dart';
part 'suite_model.g.dart';

@freezed
class SuiteModel with _$SuiteModel {
  const SuiteModel._();
  const factory SuiteModel({
    @JsonKey(name: 'nome') required String name,
    @JsonKey(name: 'qtd') required int quantity,
    @JsonKey(name: 'exibirQtdDisponiveis') required bool showAvailableQuantity,
    @JsonKey(name: 'fotos') required List<String> photos,
    @JsonKey(name: 'itens') required List<ItemModel> items,
    @JsonKey(name: 'categoriaItens')
    required List<CategoryItemModel> categoryItems,
    @JsonKey(name: 'periodos') required List<PeriodModel> periods,
  }) = _SuiteModel;

  factory SuiteModel.fromJson(Map<String, dynamic> json) =>
      _$SuiteModelFromJson(json);

  (PeriodModel?, bool) get period {
    if (periods.isEmpty) {
      return (null, false);
    }

    final periodsWithDiscount =
        periods.where((p) => p.discount != null).toList();
    final periodsWithoutDiscount =
        periods.where((p) => p.discount == null).toList();

    if (periodsWithDiscount.isNotEmpty) {
      final minDiscountedPeriod = periodsWithDiscount.reduce(
        (curr, next) => curr.totalPrice < next.totalPrice ? curr : next,
      );
      return (minDiscountedPeriod, true);
    } else {
      final minPeriod = periodsWithoutDiscount.reduce(
        (curr, next) => curr.totalPrice < next.totalPrice ? curr : next,
      );
      return (minPeriod, false);
    }
  }
}
