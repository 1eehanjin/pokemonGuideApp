import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_guides_app/Datas/pokemon_type.dart';

@JsonSerializable()
class MoveModel {
  MoveModel(
      this.name,
      this.type,
      this.category,
      this.power,
      this.accuracy,
      this.pp,
      this.effect
      );

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  @JsonKey(disallowNullValue: true)
  final String name;

  final PokemonTypes type;

  final int power;

  final double accuracy;

  final int pp;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(name: 'imageurl', disallowNullValue: true)
  final String effect;

}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'name',
    'imageurl',
  ]);
  return MoveModel(
    json['name'] as String,
    PokemonTypesX.parse(json['type'] as String),
    (json['category'] ?? '') as String,
    (json['power'] ?? 0 ) as int,
    (json['accuracy'] ?? 0.0) as double,
    (json['pp'] ?? 0) as int,
    ("")as String,
  );
}