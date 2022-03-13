import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _initialBuild = true;
  String _initialLanguageCode = '';
  String _selectedLanguageCode = '';

  @override
  Widget build(BuildContext context) {
    if (_initialBuild) {
      _initialLanguageCode = context.locale.languageCode;
      _selectedLanguageCode = _initialLanguageCode;
      _initialBuild = false;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop({"reload": _initialLanguageCode != _selectedLanguageCode}),
        ),
        title: Text(LocaleKeys.settings_appbar_title.tr()),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          children: [
            _buildLanguageDropdown(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    var dropDownMenuItems = <DropdownMenuItem<String>>[
      DropdownMenuItem(
        value: 'en',
        child: Text(LocaleKeys.settings_dropdown_item_english.tr()),
      ),
      DropdownMenuItem(
        value: 'de',
        child: Text(LocaleKeys.settings_dropdown_item_german.tr()),
      ),
    ];

    return Row(
      children: [
        Text('${LocaleKeys.settings_dropdown_label_set_language.tr()}:'),
        const SizedBox(width: 12.0),
        DropdownButton<String>(
          value: _selectedLanguageCode,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedLanguageCode = newValue;
              });

              switch (newValue) {
                case 'en':
                  context.setLocale(context.supportedLocales[0]);
                  break;
                case 'de':
                  context.setLocale(context.supportedLocales[1]);
                  break;
                default:
                  context.setLocale(context.supportedLocales[0]);
                  break;
              }
            }
          },
          items: dropDownMenuItems,
        ),
      ],
    );
  }
}
