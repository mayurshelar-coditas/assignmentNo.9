class Language {
  final int id;
  final String name, languageCode;

  Language({
    required this.id,
    required this.name,
    required this.languageCode,
  });

  static List<Language> languageList() {
    return <Language>[
      Language(id: 1, name: 'English', languageCode: "en"),
      Language(id: 2, name: 'Hindi', languageCode: "hi"),
      Language(id: 3, name: 'Marathi', languageCode: "mr"),
      Language(id: 4, name: 'Arabic', languageCode: "ar"),
    ];
  }
}
