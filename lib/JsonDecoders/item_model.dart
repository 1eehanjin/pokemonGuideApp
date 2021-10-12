import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ItemModel {
  ItemModel(
      this.name,
      this.imageUrl,
      this.category,
      this.effect
      );

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(name: 'imageurl', disallowNullValue: true)
  final String imageUrl;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(name: 'imageurl', disallowNullValue: true)
  final String effect;

}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'name',
    'imageurl',
  ]);
  return ItemModel(
    json['name'] as String,
    json['imageurl'] as String,
    (json['category'] ?? '') as String,
    json['effect'] as String,
  );
}