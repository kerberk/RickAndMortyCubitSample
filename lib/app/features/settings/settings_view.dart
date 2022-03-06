import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings_appbar_title.tr()),
      ),
      body: Column(
        children: [
          _buildLanguageDropdown(context),
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    var dropDownMenuItems = <DropdownMenuItem<String>>[];
    dropDownMenuItems.add(DropdownMenuItem(value: '', child: Text(LocaleKeys.settings_hints_dropdown.tr())));
    dropDownMenuItems
        .add(DropdownMenuItem(value: 'en-US', child: Text(LocaleKeys.settings_dropdown_item_english.tr())));
    dropDownMenuItems.add(DropdownMenuItem(value: 'de-DE', child: Text(LocaleKeys.settings_dropdown_item_german.tr())));

    return DropdownButton<String>(
      onChanged: (String? newValue) {
        if (newValue != null) {
          switch (newValue) {
            case 'en-US':
              context.setLocale(context.supportedLocales[0]);
              break;
            case 'de-DE':
              context.setLocale(context.supportedLocales[1]);
              break;
            default:
              context.setLocale(context.supportedLocales[0]);
              break;
          }
        }
      },
      items: dropDownMenuItems,
    );
  }
}
