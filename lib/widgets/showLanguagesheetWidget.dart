import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/tabs/settings/settings_provider.dart';

class ShowLanguageSheet extends StatelessWidget {
  const ShowLanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<SettingsProvider>(context, listen: false);
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            methods.changeLanguageCode('en');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  S.of(context).english,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                provider.languageCode == 'en'
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      )
                    : Container()
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        InkWell(
          onTap: () {
            methods.changeLanguageCode('ar');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  S.of(context).arabic,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                provider.languageCode == 'ar'
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
