// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuiteModel _$SuiteModelFromJson(Map<String, dynamic> json) {
  return _SuiteModel.fromJson(json);
}

/// @nodoc
mixin _$SuiteModel {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool get showAvailableQuantity => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  List<ItemModel> get items => throw _privateConstructorUsedError;
  List<CategoryItemModel> get categoryItems =>
      throw _privateConstructorUsedError;
  List<PeriodModel> get periods => throw _privateConstructorUsedError;

  /// Serializes this SuiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuiteModelCopyWith<SuiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuiteModelCopyWith<$Res> {
  factory $SuiteModelCopyWith(
          SuiteModel value, $Res Function(SuiteModel) then) =
      _$SuiteModelCopyWithImpl<$Res, SuiteModel>;
  @useResult
  $Res call(
      {String name,
      int quantity,
      bool showAvailableQuantity,
      List<String> photos,
      List<ItemModel> items,
      List<CategoryItemModel> categoryItems,
      List<PeriodModel> periods});
}

/// @nodoc
class _$SuiteModelCopyWithImpl<$Res, $Val extends SuiteModel>
    implements $SuiteModelCopyWith<$Res> {
  _$SuiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? showAvailableQuantity = null,
    Object? photos = null,
    Object? items = null,
    Object? categoryItems = null,
    Object? periods = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      showAvailableQuantity: null == showAvailableQuantity
          ? _value.showAvailableQuantity
          : showAvailableQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      categoryItems: null == categoryItems
          ? _value.categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryItemModel>,
      periods: null == periods
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<PeriodModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuiteModelImplCopyWith<$Res>
    implements $SuiteModelCopyWith<$Res> {
  factory _$$SuiteModelImplCopyWith(
          _$SuiteModelImpl value, $Res Function(_$SuiteModelImpl) then) =
      __$$SuiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int quantity,
      bool showAvailableQuantity,
      List<String> photos,
      List<ItemModel> items,
      List<CategoryItemModel> categoryItems,
      List<PeriodModel> periods});
}

/// @nodoc
class __$$SuiteModelImplCopyWithImpl<$Res>
    extends _$SuiteModelCopyWithImpl<$Res, _$SuiteModelImpl>
    implements _$$SuiteModelImplCopyWith<$Res> {
  __$$SuiteModelImplCopyWithImpl(
      _$SuiteModelImpl _value, $Res Function(_$SuiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? showAvailableQuantity = null,
    Object? photos = null,
    Object? items = null,
    Object? categoryItems = null,
    Object? periods = null,
  }) {
    return _then(_$SuiteModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      showAvailableQuantity: null == showAvailableQuantity
          ? _value.showAvailableQuantity
          : showAvailableQuantity // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      categoryItems: null == categoryItems
          ? _value._categoryItems
          : categoryItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryItemModel>,
      periods: null == periods
          ? _value._periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<PeriodModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuiteModelImpl implements _SuiteModel {
  const _$SuiteModelImpl(
      {required this.name,
      required this.quantity,
      required this.showAvailableQuantity,
      required final List<String> photos,
      required final List<ItemModel> items,
      required final List<CategoryItemModel> categoryItems,
      required final List<PeriodModel> periods})
      : _photos = photos,
        _items = items,
        _categoryItems = categoryItems,
        _periods = periods;

  factory _$SuiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuiteModelImplFromJson(json);

  @override
  final String name;
  @override
  final int quantity;
  @override
  final bool showAvailableQuantity;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<ItemModel> _items;
  @override
  List<ItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<CategoryItemModel> _categoryItems;
  @override
  List<CategoryItemModel> get categoryItems {
    if (_categoryItems is EqualUnmodifiableListView) return _categoryItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryItems);
  }

  final List<PeriodModel> _periods;
  @override
  List<PeriodModel> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  @override
  String toString() {
    return 'SuiteModel(name: $name, quantity: $quantity, showAvailableQuantity: $showAvailableQuantity, photos: $photos, items: $items, categoryItems: $categoryItems, periods: $periods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuiteModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.showAvailableQuantity, showAvailableQuantity) ||
                other.showAvailableQuantity == showAvailableQuantity) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._categoryItems, _categoryItems) &&
            const DeepCollectionEquality().equals(other._periods, _periods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      quantity,
      showAvailableQuantity,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_categoryItems),
      const DeepCollectionEquality().hash(_periods));

  /// Create a copy of SuiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuiteModelImplCopyWith<_$SuiteModelImpl> get copyWith =>
      __$$SuiteModelImplCopyWithImpl<_$SuiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuiteModelImplToJson(
      this,
    );
  }
}

abstract class _SuiteModel implements SuiteModel {
  const factory _SuiteModel(
      {required final String name,
      required final int quantity,
      required final bool showAvailableQuantity,
      required final List<String> photos,
      required final List<ItemModel> items,
      required final List<CategoryItemModel> categoryItems,
      required final List<PeriodModel> periods}) = _$SuiteModelImpl;

  factory _SuiteModel.fromJson(Map<String, dynamic> json) =
      _$SuiteModelImpl.fromJson;

  @override
  String get name;
  @override
  int get quantity;
  @override
  bool get showAvailableQuantity;
  @override
  List<String> get photos;
  @override
  List<ItemModel> get items;
  @override
  List<CategoryItemModel> get categoryItems;
  @override
  List<PeriodModel> get periods;

  /// Create a copy of SuiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuiteModelImplCopyWith<_$SuiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
