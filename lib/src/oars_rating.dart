enum OarsRatingValue { unknown, none, mild, moderate, intense }

class ContentRatingOarsOneDotZero {
  final OarsRatingValue drugsAlcohol;
  final OarsRatingValue drugsNarcotics;
  final OarsRatingValue drugsTobacco;
  final OarsRatingValue languageDiscrimination;
  final OarsRatingValue languageHumor;
  final OarsRatingValue languageProfanity;
  final OarsRatingValue moneyGambling;
  final OarsRatingValue moneyPurchasing;
  final OarsRatingValue sexNudity;
  final OarsRatingValue sexThemes;
  final OarsRatingValue socialAudio;
  final OarsRatingValue socialChat;
  final OarsRatingValue socialContacts;
  final OarsRatingValue socialInfo;
  final OarsRatingValue socialLocation;
  final OarsRatingValue violenceBloodshed;
  final OarsRatingValue violenceCartoon;
  final OarsRatingValue violenceFantasy;
  final OarsRatingValue violenceRealistic;
  final OarsRatingValue violenceSexual;

  ContentRatingOarsOneDotZero({
    required this.drugsAlcohol,
    required this.drugsNarcotics,
    required this.drugsTobacco,
    required this.languageDiscrimination,
    required this.languageHumor,
    required this.languageProfanity,
    required this.moneyGambling,
    required this.moneyPurchasing,
    required this.sexNudity,
    required this.sexThemes,
    required this.socialAudio,
    required this.socialChat,
    required this.socialContacts,
    required this.socialInfo,
    required this.socialLocation,
    required this.violenceBloodshed,
    required this.violenceCartoon,
    required this.violenceFantasy,
    required this.violenceRealistic,
    required this.violenceSexual,
  });

  factory ContentRatingOarsOneDotZero.fromJson(Map<String, dynamic> json) {
    return ContentRatingOarsOneDotZero(
      drugsAlcohol: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-alcohol']}"),
      drugsNarcotics: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-narcotics']}"),
      drugsTobacco: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-tobacco']}"),
      languageDiscrimination: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['language-discrimination']}"),
      languageHumor: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['language-humor']}"),
      languageProfanity: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['language-profanity']}"),
      moneyGambling: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['money-gambling']}"),
      moneyPurchasing: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['money-purchasing']}"),
      sexNudity: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['sex-nudity']}"),
      sexThemes: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['sex-themes']}"),
      socialAudio: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-audio']}"),
      socialChat: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-chat']}"),
      socialContacts: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-contacts']}"),
      socialInfo: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-info']}"),
      socialLocation: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-location']}"),
      violenceBloodshed: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['violence-bloodshed']}"),
      violenceCartoon: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-cartoon']}"),
      violenceFantasy: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-fantasy']}"),
      violenceRealistic: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['violence-realistic']}"),
      violenceSexual: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-sexual']}"),
    );
  }

  void printRatings(String type) {
    print("[Content Ratings]");
    print("\ttype:  $type");
    print("\tdrugs-alcohol: ${drugsAlcohol.toString().split('.').last}");
    print("\tdrugs-narcotics: ${drugsNarcotics.toString().split('.').last}");
    print("\tdrugs-tobacco: ${drugsTobacco.toString().split('.').last}");
    print(
        "\tlanguage-discrimination: ${languageDiscrimination.toString().split('.').last}");
    print("\tlanguage-humor: ${languageHumor.toString().split('.').last}");
    print(
        "\tlanguage-profanity: ${languageProfanity.toString().split('.').last}");
    print("\tmoney-gambling: ${moneyGambling.toString().split('.').last}");
    print("\tmoney-purchasing: ${moneyPurchasing.toString().split('.').last}");
    print("\tsex-nudity: ${sexNudity.toString().split('.').last}");
    print("\tsex-themes: ${sexThemes.toString().split('.').last}");
    print("\tsocial-audio: ${socialAudio.toString().split('.').last}");
    print("\tsocial-chat: ${socialChat.toString().split('.').last}");
    print("\tsocial-contacts: ${socialContacts.toString().split('.').last}");
    print("\tsocial-info: ${socialInfo.toString().split('.').last}");
    print("\tsocial-location: ${socialLocation.toString().split('.').last}");
    print(
        "\tviolence-bloodshed: ${violenceBloodshed.toString().split('.').last}");
    print("\tviolence-cartoon: ${violenceCartoon.toString().split('.').last}");
    print("\tviolence-fantasy: ${violenceFantasy.toString().split('.').last}");
    print(
        "\tviolence-realistic: ${violenceRealistic.toString().split('.').last}");
    print("\tviolence-sexual: ${violenceSexual.toString().split('.').last}");
  }
}

class ContentRatingOarsOneDotOne {
  final OarsRatingValue drugsAlcohol;
  final OarsRatingValue drugsNarcotics;
  final OarsRatingValue drugsTobacco;
  final OarsRatingValue languageDiscrimination;
  final OarsRatingValue languageHumor;
  final OarsRatingValue languageProfanity;
  final OarsRatingValue moneyGambling;
  final OarsRatingValue moneyPurchasing;
  final OarsRatingValue sexNudity;
  final OarsRatingValue sexThemes;
  final OarsRatingValue socialAudio;
  final OarsRatingValue socialChat;
  final OarsRatingValue socialContacts;
  final OarsRatingValue socialInfo;
  final OarsRatingValue socialLocation;
  final OarsRatingValue violenceBloodshed;
  final OarsRatingValue violenceCartoon;
  final OarsRatingValue violenceDesecration;
  final OarsRatingValue violenceFantasy;
  final OarsRatingValue violenceRealistic;
  final OarsRatingValue violenceSexual;
  final OarsRatingValue violenceSlavery;

  ContentRatingOarsOneDotOne({
    required this.drugsAlcohol,
    required this.drugsNarcotics,
    required this.drugsTobacco,
    required this.languageDiscrimination,
    required this.languageHumor,
    required this.languageProfanity,
    required this.moneyGambling,
    required this.moneyPurchasing,
    required this.sexNudity,
    required this.sexThemes,
    required this.socialAudio,
    required this.socialChat,
    required this.socialContacts,
    required this.socialInfo,
    required this.socialLocation,
    required this.violenceBloodshed,
    required this.violenceCartoon,
    required this.violenceDesecration, //
    required this.violenceFantasy,
    required this.violenceRealistic,
    required this.violenceSexual,
    required this.violenceSlavery,
  });

  factory ContentRatingOarsOneDotOne.fromJson(Map<String, dynamic> json) {
    return ContentRatingOarsOneDotOne(
      drugsAlcohol: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-alcohol']}"),
      drugsNarcotics: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-narcotics']}"),
      drugsTobacco: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['drugs-tobacco']}"),
      languageDiscrimination: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['language-discrimination']}"),
      languageHumor: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['language-humor']}"),
      languageProfanity: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['language-profanity']}"),
      moneyGambling: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['money-gambling']}"),
      moneyPurchasing: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['money-purchasing']}"),
      sexNudity: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['sex-nudity']}"),
      sexThemes: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['sex-themes']}"),
      socialAudio: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-audio']}"),
      socialChat: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-chat']}"),
      socialContacts: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-contacts']}"),
      socialInfo: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-info']}"),
      socialLocation: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['social-location']}"),
      violenceBloodshed: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['violence-bloodshed']}"),
      violenceCartoon: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-cartoon']}"),
      violenceFantasy: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-fantasy']}"),
      violenceDesecration: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['violence-desecration']}"),
      violenceRealistic: OarsRatingValue.values.firstWhere((e) =>
          e.toString() == "OarsRatingValue.${json['violence-realistic']}"),
      violenceSexual: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-sexual']}"),
      violenceSlavery: OarsRatingValue.values.firstWhere(
          (e) => e.toString() == "OarsRatingValue.${json['violence-slavery']}"),
    );
  }

  void printRatings(String type) {
    print("[Content Ratings]");
    print("\ttype:  $type");
    print("\tdrugs-alcohol: ${drugsAlcohol.toString().split('.').last}");
    print("\tdrugs-narcotics: ${drugsNarcotics.toString().split('.').last}");
    print("\tdrugs-tobacco: ${drugsTobacco.toString().split('.').last}");
    print(
        "\tlanguage-discrimination: ${languageDiscrimination.toString().split('.').last}");
    print("\tlanguage-humor: ${languageHumor.toString().split('.').last}");
    print(
        "\tlanguage-profanity: ${languageProfanity.toString().split('.').last}");
    print("\tmoney-gambling: ${moneyGambling.toString().split('.').last}");
    print("\tmoney-purchasing: ${moneyPurchasing.toString().split('.').last}");
    print("\tsex-nudity: ${sexNudity.toString().split('.').last}");
    print("\tsex-themes: ${sexThemes.toString().split('.').last}");
    print("\tsocial-audio: ${socialAudio.toString().split('.').last}");
    print("\tsocial-chat: ${socialChat.toString().split('.').last}");
    print("\tsocial-contacts: ${socialContacts.toString().split('.').last}");
    print("\tsocial-info: ${socialInfo.toString().split('.').last}");
    print("\tsocial-location: ${socialLocation.toString().split('.').last}");
    print(
        "\tviolence-bloodshed: ${violenceBloodshed.toString().split('.').last}");
    print("\tviolence-cartoon: ${violenceCartoon.toString().split('.').last}");
    print("\tviolence-fantasy: ${violenceFantasy.toString().split('.').last}");
    print(
        "\tviolence-desecration: ${violenceDesecration.toString().split('.').last}");
    print(
        "\tviolence-realistic: ${violenceRealistic.toString().split('.').last}");
    print("\tviolence-sexual: ${violenceSexual.toString().split('.').last}");
    print("\tviolence-slavery: ${violenceSlavery.toString().split('.').last}");
  }
}
