import 'package:flutter/material.dart';
import 'package:todoapp/app_theme.dart';
import 'package:todoapp/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    settingsProvider.changeTheme(ThemeMode.dark);
                  } else {
                    settingsProvider.changeTheme(ThemeMode.light);
                  }
                },
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Theme.of(context).primaryColor,
                thumbColor: MaterialStatePropertyAll(AppTheme.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    value: languages.firstWhere(
                      (lang) => lang.code == settingsProvider.languageCode,
                    ),
                    items: languages
                        .map(
                          (language) => DropdownMenuItem<Language>(
                            value: language,
                            child: Text(
                              language.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingsProvider
                            .changeLanguageCode(selectedLanguage.code);
                      }
                    },
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Language {
  String name;
  String code;

  Language({
    required this.name,
    required this.code,
  });
}
