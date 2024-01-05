import 'dart:convert';

BrandedFood brandedFoodFromJson(String str) =>
    BrandedFood.fromJson(json.decode(str));

String brandedFoodToJson(BrandedFood data) => json.encode(data.toJson());

class BrandedFood {
  String? fdcId;
  String? description;
  String? brandOwner;
  String? brandName;
  List<FoodNutrient>? foodNutrients;
  List<dynamic>? foodPortions;
  String? dataType;

  BrandedFood(
      {this.fdcId,
      this.description,
      this.brandOwner,
      this.brandName,
      this.foodNutrients,
      this.foodPortions,
      this.dataType});

  factory BrandedFood.fromJson(Map<String, dynamic> json) => BrandedFood(
        fdcId: json["fdcId"].toString(),
        description: json["description"],
        brandOwner: json["brandOwner"],
        brandName: json["brandName"],
        foodNutrients: List<FoodNutrient>.from(
            json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
        foodPortions: json["foodPortions"] == null
            ? []
            : List<dynamic>.from(json["foodPortions"]!.map((x) => x)),
        dataType: json["dataType"],
      );

  Map<String, dynamic> toJson() => {
        "fdcId": fdcId,
        "description": description,
        "brandOwner": brandOwner,
        "brandName": brandName,
        "foodNutrients": foodNutrients == null
            ? []
            : List<dynamic>.from(foodNutrients!.map((x) => x.toJson())),
        "foodPortions": foodPortions == null
            ? []
            : List<dynamic>.from(foodPortions!.map((x) => x)),
        "dataType": dataType,
      };
}

class FoodNutrient {
  Type? type;
  Nutrient? nutrient;
  FoodNutrientDerivation? foodNutrientDerivation;
  String? id;
  double? amount;

  FoodNutrient({
    this.type,
    this.nutrient,
    this.foodNutrientDerivation,
    this.id,
    this.amount,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        type: typeValues.map[json["type"]]!,
        nutrient: json["nutrient"] == null
            ? null
            : Nutrient.fromJson(json["nutrient"]),
        foodNutrientDerivation: json["foodNutrientDerivation"] == null
            ? null
            : FoodNutrientDerivation.fromJson(json["foodNutrientDerivation"]),
        id: json["id"].toString(),
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "nutrient": nutrient?.toJson(),
        "foodNutrientDerivation": foodNutrientDerivation?.toJson(),
        "id": id,
        "amount": amount,
      };
}

class FoodNutrientDerivation {
  String? id;
  Code? code;
  String? description;

  FoodNutrientDerivation({
    this.id,
    this.code,
    this.description,
  });

  factory FoodNutrientDerivation.fromJson(Map<String, dynamic> json) =>
      FoodNutrientDerivation(
        id: json["id"].toString(),
        code: codeValues.map[json["code"]],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": codeValues.reverse[code],
        "description": description,
      };
}

enum Code { LCCD, LCCS }

final codeValues = EnumValues({"LCCD": Code.LCCD, "LCCS": Code.LCCS});

class Nutrient {
  String? id;
  String? number;
  String? name;
  String? rank;
  String? unitName;

  Nutrient({
    this.id,
    this.number,
    this.name,
    this.rank,
    this.unitName,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        id: json["id"].toString(),
        number: json["number"].toString(),
        name: json["name"],
        rank: json["rank"].toString(),
        unitName: json["unitName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "rank": rank,
        "unitName": unitName,
      };
}

enum Type { FOOD_NUTRIENT }

final typeValues = EnumValues({"FoodNutrient": Type.FOOD_NUTRIENT});

class LabelNutrient {
  double? value;

  LabelNutrient({
    this.value,
  });

  factory LabelNutrient.fromJson(Map<String, dynamic> json) => LabelNutrient(
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
