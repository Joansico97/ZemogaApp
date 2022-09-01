import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizationService {
  AppLocalizationService(this.locale);

  final Locale locale;

  static AppLocalizationService of(BuildContext context) {
    return Localizations.of<AppLocalizationService>(
      context,
      AppLocalizationService,
    )!;
  }

  static const LocalizationsDelegate<AppLocalizationService> delegate = _AppLocalizationDelegate();

  late Map<String, dynamic> _localizedStrings;

  /// It loads the JSON file from the assets folder and decodes it into a Map
  ///
  /// Returns:
  ///   A MapEntry<String, dynamic>
  Future<void> load() async {
    final jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map<String, dynamic>((key, dynamic value) {
      return MapEntry<String, dynamic>(key, value);
    });
  }

  /// If the key is not null, return the value of the key in the screen map
  ///
  /// Args:
  ///   screen (String): The screen you want to translate.
  ///   key (String): The key of the string you want to translate.
  ///
  /// Returns:
  ///   A string.
  String? translate(String screen, String? key) {
    if (key != null) {
      final returnedScreen = _localizedStrings[screen]! as Map<String, dynamic>;
      final returnedKey = returnedScreen[key] as String?;
      return returnedKey;
    } else {
      return null;
    }
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizationService> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizationService> load(Locale locale) async {
    final localizationService = AppLocalizationService(locale);
    await localizationService.load();
    return localizationService;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizationService> old) => false;
}
