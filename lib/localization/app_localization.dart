import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValue = {
    'en': {
      'hello-word': 'Hello word!',
    },
    'vi': {
      'hello-word': 'Xin chào thế giới!',
    },
  };

  String translate(String key) {
    return _localizedValue[locale.languageCode]![key] ?? '**$key not foud';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
