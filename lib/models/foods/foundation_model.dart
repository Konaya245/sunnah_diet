// To parse this JSON data, do
//
//     final foundationFood = foundationFoodFromJson(jsonString);

import 'dart:convert';

FoundationFood foundationFoodFromJson(String str) =>
    FoundationFood.fromJson(json.decode(str));

String foundationFoodToJson(FoundationFood data) => json.encode(data.toJson());

class FoundationFood {
  String? fdcId;
  String? description;
  String? publicationDate;
  List<FoodNutrient>? foodNutrients;
  String? dataType;
  String? foodClass;
  List<InputFoodElement>? inputFoods;
  List<dynamic>? foodComponents;
  List<dynamic>? foodAttributes;
  List<NutrientConversionFactor>? nutrientConversionFactors;
  String? ndbNumber;
  bool? isHistoricalReference;
  Food? foodCategory;

  FoundationFood({
    this.fdcId,
    this.description,
    this.publicationDate,
    this.foodNutrients,
    this.dataType,
    this.foodClass,
    this.inputFoods,
    this.foodComponents,
    this.foodAttributes,
    this.nutrientConversionFactors,
    this.ndbNumber,
    this.isHistoricalReference,
    this.foodCategory,
  });

  factory FoundationFood.fromJson(Map<String, dynamic> json) => FoundationFood(
        fdcId: json["fdcId"].toString(),
        description: json["description"],
        publicationDate: json["publicationDate"],
        foodNutrients: json["foodNutrients"] == null
            ? []
            : List<FoodNutrient>.from(
                json["foodNutrients"]!.map((x) => FoodNutrient.fromJson(x))),
        dataType: json["dataType"],
        foodClass: json["foodClass"],
        inputFoods: json["inputFoods"] == null
            ? []
            : List<InputFoodElement>.from(
                json["inputFoods"]!.map((x) => InputFoodElement.fromJson(x))),
        foodComponents: json["foodComponents"] == null
            ? []
            : List<dynamic>.from(json["foodComponents"]!.map((x) => x)),
        foodAttributes: json["foodAttributes"] == null
            ? []
            : List<dynamic>.from(json["foodAttributes"]!.map((x) => x)),
        nutrientConversionFactors: json["nutrientConversionFactors"] == null
            ? []
            : List<NutrientConversionFactor>.from(
                json["nutrientConversionFactors"]!
                    .map((x) => NutrientConversionFactor.fromJson(x))),
        ndbNumber: json["ndbNumber"].toString(),
        isHistoricalReference: json["isHistoricalReference"],
        foodCategory: json["foodCategory"] == null
            ? null
            : Food.fromJson(json["foodCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "fdcId": fdcId,
        "description": description,
        "publicationDate": publicationDate,
        "foodNutrients": foodNutrients == null
            ? []
            : List<dynamic>.from(foodNutrients!.map((x) => x.toJson())),
        "dataType": dataType,
        "foodClass": foodClass,
        "inputFoods": inputFoods == null
            ? []
            : List<dynamic>.from(inputFoods!.map((x) => x.toJson())),
        "foodComponents": foodComponents == null
            ? []
            : List<dynamic>.from(foodComponents!.map((x) => x)),
        "foodAttributes": foodAttributes == null
            ? []
            : List<dynamic>.from(foodAttributes!.map((x) => x)),
        "nutrientConversionFactors": nutrientConversionFactors == null
            ? []
            : List<dynamic>.from(
                nutrientConversionFactors!.map((x) => x.toJson())),
        "ndbNumber": ndbNumber,
        "isHistoricalReference": isHistoricalReference,
        "foodCategory": foodCategory?.toJson(),
      };
}

class Food {
  String? id;
  String? code;
  Description? description;
  Food? foodNutrientSource;

  Food({
    this.id,
    this.code,
    this.description,
    this.foodNutrientSource,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"].toString(),
        code: json["code"],
        description: descriptionValues.map[json["description"]],
        foodNutrientSource: json["foodNutrientSource"] == null
            ? null
            : Food.fromJson(json["foodNutrientSource"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description": descriptionValues.reverse[description],
        "foodNutrientSource": foodNutrientSource?.toJson(),
      };
}

enum Description {
  ANALYTICAL,
  ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  CALCULATED,
  CALCULATED_OR_IMPUTED,
  NUT_AND_SEED_PRODUCTS
}

final descriptionValues = EnumValues({
  "Analytical": Description.ANALYTICAL,
  "Analytical or derived from analytical":
      Description.ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  "Calculated": Description.CALCULATED,
  "Calculated or imputed": Description.CALCULATED_OR_IMPUTED,
  "Nut and Seed Products": Description.NUT_AND_SEED_PRODUCTS
});

class FoodNutrient {
  Nutrient? nutrient;
  Type? type;
  Food? foodNutrientDerivation;
  String? id;
  double? amount;
  String? dataPoints;
  double? max;
  double? min;
  double? median;
  String? minYearAcquired;
  List<NutrientAnalysisDetail>? nutrientAnalysisDetails;
  double? loq;

  FoodNutrient({
    this.nutrient,
    this.type,
    this.foodNutrientDerivation,
    this.id,
    this.amount,
    this.dataPoints,
    this.max,
    this.min,
    this.median,
    this.minYearAcquired,
    this.nutrientAnalysisDetails,
    this.loq,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        nutrient: json["nutrient"] == null
            ? null
            : Nutrient.fromJson(json["nutrient"]),
        type: typeValues.map[json["type"]],
        foodNutrientDerivation: json["foodNutrientDerivation"] == null
            ? null
            : Food.fromJson(json["foodNutrientDerivation"]),
        id: json["id"].toString(),
        amount: json["amount"]?.toDouble(),
        dataPoints: json["dataPoints"].toString(),
        max: json["max"]?.toDouble(),
        min: json["min"]?.toDouble(),
        median: json["median"]?.toDouble(),
        minYearAcquired: json["minYearAcquired"].toString(),
        nutrientAnalysisDetails: json["nutrientAnalysisDetails"] == null
            ? []
            : List<NutrientAnalysisDetail>.from(json["nutrientAnalysisDetails"]!
                .map((x) => NutrientAnalysisDetail.fromJson(x))),
        loq: json["loq"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nutrient": nutrient?.toJson(),
        "type": typeValues.reverse[type],
        "foodNutrientDerivation": foodNutrientDerivation?.toJson(),
        "id": id,
        "amount": amount,
        "dataPoints": dataPoints,
        "max": max,
        "min": min,
        "median": median,
        "minYearAcquired": minYearAcquired,
        "nutrientAnalysisDetails": nutrientAnalysisDetails == null
            ? []
            : List<dynamic>.from(
                nutrientAnalysisDetails!.map((x) => x.toJson())),
        "loq": loq,
      };
}

class Nutrient {
  String? id;
  String? number;
  String? name;
  String? rank;
  UnitName? unitName;

  Nutrient({
    this.id,
    this.number,
    this.name,
    this.rank,
    this.unitName,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        id: json["id"].toString(),
        number: json["number"],
        name: json["name"],
        rank: json["rank"].toString(),
        unitName: unitNameValues.map[json["unitName"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "rank": rank,
        "unitName": unitNameValues.reverse[unitName],
      };
}

enum UnitName { G, KCAL, MG, UNIT_NAME_G }

final unitNameValues = EnumValues({
  "g": UnitName.G,
  "kcal": UnitName.KCAL,
  "mg": UnitName.MG,
  "µg": UnitName.UNIT_NAME_G
});

class NutrientAnalysisDetail {
  String? subSampleId;
  String? nutrientId;
  List<NutrientAcquisitionDetail>? nutrientAcquisitionDetails;
  double? amount;
  LabMethodTechnique? labMethodTechnique;
  LabMethodDescription? labMethodDescription;
  String? labMethodOriginalDescription;
  String? labMethodLink;
  double? loq;

  NutrientAnalysisDetail({
    this.subSampleId,
    this.nutrientId,
    this.nutrientAcquisitionDetails,
    this.amount,
    this.labMethodTechnique,
    this.labMethodDescription,
    this.labMethodOriginalDescription,
    this.labMethodLink,
    this.loq,
  });

  factory NutrientAnalysisDetail.fromJson(Map<String, dynamic> json) =>
      NutrientAnalysisDetail(
        subSampleId: json["subSampleId"].toString(),
        nutrientId: json["nutrientId"].toString(),
        nutrientAcquisitionDetails: json["nutrientAcquisitionDetails"] == null
            ? []
            : List<NutrientAcquisitionDetail>.from(
                json["nutrientAcquisitionDetails"]!
                    .map((x) => NutrientAcquisitionDetail.fromJson(x))),
        amount: json["amount"]?.toDouble(),
        labMethodTechnique:
            labMethodTechniqueValues.map[json["labMethodTechnique"]]!,
        labMethodDescription:
            labMethodDescriptionValues.map[json["labMethodDescription"]]!,
        labMethodOriginalDescription: json["labMethodOriginalDescription"],
        labMethodLink: json["labMethodLink"],
        loq: json["loq"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "subSampleId": subSampleId,
        "nutrientId": nutrientId,
        "nutrientAcquisitionDetails": nutrientAcquisitionDetails == null
            ? []
            : List<dynamic>.from(
                nutrientAcquisitionDetails!.map((x) => x.toJson())),
        "amount": amount,
        "labMethodTechnique":
            labMethodTechniqueValues.reverse[labMethodTechnique],
        "labMethodDescription":
            labMethodDescriptionValues.reverse[labMethodDescription],
        "labMethodOriginalDescription": labMethodOriginalDescription,
        "labMethodLink": labMethodLink,
        "loq": loq,
      };
}

enum LabMethodDescription {
  AOAC_200110,
  AOAC_201119,
  AOAC_93406_MOD,
  AOAC_94223,
  AOAC_944139604698534,
  AOAC_94546,
  AOAC_96115,
  AOAC_9850198427,
  AOAC_98905_MOD,
  AOAC_99120,
  AOAC_99143,
  AOAC_99205,
  AOAC_99606,
  DOI_ORG_101002_JPS_2600560249,
  DOI_ORG_101016_S0076_687997821283,
  IN_HOUSE_HPLC_RETINOL,
  USDA_GUIDEBOOK_1986
}

final labMethodDescriptionValues = EnumValues({
  "AOAC 2001.10": LabMethodDescription.AOAC_200110,
  "AOAC 2011.19": LabMethodDescription.AOAC_201119,
  "AOAC 934.06 mod": LabMethodDescription.AOAC_93406_MOD,
  "AOAC 942.23": LabMethodDescription.AOAC_94223,
  "AOAC 944.13 + 960.46 + 985.34": LabMethodDescription.AOAC_944139604698534,
  "AOAC 945.46": LabMethodDescription.AOAC_94546,
  "AOAC 961.15": LabMethodDescription.AOAC_96115,
  "AOAC 985.01 + 984.27": LabMethodDescription.AOAC_9850198427,
  "AOAC 989.05 mod": LabMethodDescription.AOAC_98905_MOD,
  "AOAC 991.20": LabMethodDescription.AOAC_99120,
  "AOAC 991.43": LabMethodDescription.AOAC_99143,
  "AOAC 992.05": LabMethodDescription.AOAC_99205,
  "AOAC 996.06": LabMethodDescription.AOAC_99606,
  "doi.org/10.1002/jps.2600560249":
      LabMethodDescription.DOI_ORG_101002_JPS_2600560249,
  "doi.org/10.1016/S0076-6879(97)82128-3":
      LabMethodDescription.DOI_ORG_101016_S0076_687997821283,
  "In-house HPLC retinol": LabMethodDescription.IN_HOUSE_HPLC_RETINOL,
  "USDA Guidebook 1986": LabMethodDescription.USDA_GUIDEBOOK_1986
});

enum LabMethodTechnique {
  ACID_HYDROLYSIS,
  ENZYMATIC_GRAVIMETRIC,
  FLUOROMETRIC,
  GLC,
  GRAVIMETRIC,
  HPLC,
  ICP,
  ICP_MS,
  KJELDAHL,
  MICROBIOLOGICAL,
  NEPHELOMETRY,
  VACUUM_OVEN
}

final labMethodTechniqueValues = EnumValues({
  "Acid hydrolysis": LabMethodTechnique.ACID_HYDROLYSIS,
  "Enzymatic-gravimetric": LabMethodTechnique.ENZYMATIC_GRAVIMETRIC,
  "Fluorometric": LabMethodTechnique.FLUOROMETRIC,
  "GLC": LabMethodTechnique.GLC,
  "Gravimetric": LabMethodTechnique.GRAVIMETRIC,
  "HPLC": LabMethodTechnique.HPLC,
  "ICP": LabMethodTechnique.ICP,
  "ICP-MS": LabMethodTechnique.ICP_MS,
  "Kjeldahl": LabMethodTechnique.KJELDAHL,
  "Microbiological": LabMethodTechnique.MICROBIOLOGICAL,
  "Nephelometry": LabMethodTechnique.NEPHELOMETRY,
  "Vacuum oven": LabMethodTechnique.VACUUM_OVEN
});

class NutrientAcquisitionDetail {
  String? sampleUnitId;
  PurchaseDate? purchaseDate;
  StoreCity? storeCity;
  StoreState? storeState;
  PackerCity? packerCity;
  PackerState? packerState;

  NutrientAcquisitionDetail({
    this.sampleUnitId,
    this.purchaseDate,
    this.storeCity,
    this.storeState,
    this.packerCity,
    this.packerState,
  });

  factory NutrientAcquisitionDetail.fromJson(Map<String, dynamic> json) =>
      NutrientAcquisitionDetail(
        sampleUnitId: json["sampleUnitId"].toString(),
        purchaseDate: purchaseDateValues.map[json["purchaseDate"]],
        storeCity: storeCityValues.map[json["storeCity"]],
        storeState: storeStateValues.map[json["storeState"]],
        packerCity: packerCityValues.map[json["packerCity"]],
        packerState: packerStateValues.map[json["packerState"]],
      );

  Map<String, dynamic> toJson() => {
        "sampleUnitId": sampleUnitId,
        "purchaseDate": purchaseDateValues.reverse[purchaseDate],
        "storeCity": storeCityValues.reverse[storeCity],
        "storeState": storeStateValues.reverse[storeState],
        "packerCity": packerCityValues.reverse[packerCity],
        "packerState": packerStateValues.reverse[packerState],
      };
}

enum PackerCity {
  AUSTIN,
  CINCINNATI,
  FLOYD,
  LAKE_SUCCESS,
  MATTHEWS,
  NUNDA,
  OAKLAND,
  PROVIDENCE
}

final packerCityValues = EnumValues({
  "Austin": PackerCity.AUSTIN,
  "Cincinnati": PackerCity.CINCINNATI,
  "Floyd": PackerCity.FLOYD,
  "Lake Success": PackerCity.LAKE_SUCCESS,
  "Matthews": PackerCity.MATTHEWS,
  "Nunda": PackerCity.NUNDA,
  "Oakland": PackerCity.OAKLAND,
  "Providence": PackerCity.PROVIDENCE
});

enum PackerState { CA, NC, NY, OH, RI, TX, VA }

final packerStateValues = EnumValues({
  "CA": PackerState.CA,
  "NC": PackerState.NC,
  "NY": PackerState.NY,
  "OH": PackerState.OH,
  "RI": PackerState.RI,
  "TX": PackerState.TX,
  "VA": PackerState.VA
});

enum PurchaseDate {
  THE_6272021,
  THE_6282021,
  THE_6302021,
  THE_7192021,
  THE_7262021,
  THE_852021
}

final purchaseDateValues = EnumValues({
  "6/27/2021": PurchaseDate.THE_6272021,
  "6/28/2021": PurchaseDate.THE_6282021,
  "6/30/2021": PurchaseDate.THE_6302021,
  "7/19/2021": PurchaseDate.THE_7192021,
  "7/26/2021": PurchaseDate.THE_7262021,
  "8/5/2021": PurchaseDate.THE_852021
});

enum StoreCity { BALTIMORE, BLACKSBURG, ELLICOTT_CITY, JESSUP }

final storeCityValues = EnumValues({
  "Baltimore": StoreCity.BALTIMORE,
  "Blacksburg": StoreCity.BLACKSBURG,
  "Ellicott City": StoreCity.ELLICOTT_CITY,
  "Jessup": StoreCity.JESSUP
});

enum StoreState { MD, VA }

final storeStateValues = EnumValues({"MD": StoreState.MD, "VA": StoreState.VA});

enum Type { FOOD_NUTRIENT }

final typeValues = EnumValues({"FoodNutrient": Type.FOOD_NUTRIENT});

class InputFoodElement {
  String? id;
  String? foodDescription;
  InputFoodInputFood? inputFood;

  InputFoodElement({
    this.id,
    this.foodDescription,
    this.inputFood,
  });

  factory InputFoodElement.fromJson(Map<String, dynamic> json) =>
      InputFoodElement(
        id: json["id"].toString(),
        foodDescription: json["foodDescription"],
        inputFood: json["inputFood"] == null
            ? null
            : InputFoodInputFood.fromJson(json["inputFood"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "foodDescription": foodDescription,
        "inputFood": inputFood?.toJson(),
      };
}

class InputFoodInputFood {
  String? fdcId;
  String? description;
  String? publicationDate;
  List<dynamic>? foodAttributeTypes;
  String? foodClass;
  String? totalRefuse;
  String? dataType;
  Food? foodGroup;

  InputFoodInputFood({
    this.fdcId,
    this.description,
    this.publicationDate,
    this.foodAttributeTypes,
    this.foodClass,
    this.totalRefuse,
    this.dataType,
    this.foodGroup,
  });

  factory InputFoodInputFood.fromJson(Map<String, dynamic> json) =>
      InputFoodInputFood(
        fdcId: json["fdcId"].toString(),
        description: json["description"],
        publicationDate: json["publicationDate"],
        foodAttributeTypes: json["foodAttributeTypes"] == null
            ? []
            : List<dynamic>.from(json["foodAttributeTypes"]!.map((x) => x)),
        foodClass: json["foodClass"],
        totalRefuse: json["totalRefuse"].toString(),
        dataType: json["dataType"],
        foodGroup:
            json["foodGroup"] == null ? null : Food.fromJson(json["foodGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "fdcId": fdcId,
        "description": description,
        "publicationDate": publicationDate,
        "foodAttributeTypes": foodAttributeTypes == null
            ? []
            : List<dynamic>.from(foodAttributeTypes!.map((x) => x)),
        "foodClass": foodClass,
        "totalRefuse": totalRefuse,
        "dataType": dataType,
        "foodGroup": foodGroup?.toJson(),
      };
}

class NutrientConversionFactor {
  String? id;
  double? proteinValue;
  double? fatValue;
  double? carbohydrateValue;
  String? type;
  String? name;
  double? value;

  NutrientConversionFactor({
    this.id,
    this.proteinValue,
    this.fatValue,
    this.carbohydrateValue,
    this.type,
    this.name,
    this.value,
  });

  factory NutrientConversionFactor.fromJson(Map<String, dynamic> json) =>
      NutrientConversionFactor(
        id: json["id"].toString(),
        proteinValue: json["proteinValue"]?.toDouble(),
        fatValue: json["fatValue"]?.toDouble(),
        carbohydrateValue: json["carbohydrateValue"]?.toDouble(),
        type: json["type"],
        name: json["name"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "proteinValue": proteinValue,
        "fatValue": fatValue,
        "carbohydrateValue": carbohydrateValue,
        "type": type,
        "name": name,
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
