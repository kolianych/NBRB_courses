class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  String languageCode = 'en';

  factory LocalizationService() {
    return _instance;
  }

  LocalizationService._internal();
}
