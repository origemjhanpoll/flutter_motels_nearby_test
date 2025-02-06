import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_item_model.freezed.dart';
part 'category_item_model.g.dart';

@freezed
class CategoryItemModel with _$CategoryItemModel {
  const factory CategoryItemModel({
    @JsonKey(name: 'nome') required String name,
    @JsonKey(name: 'icone') required String icon,
  }) = _CategoryItemModel;

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemModelFromJson(json);
}
