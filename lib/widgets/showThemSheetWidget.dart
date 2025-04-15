import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/tabs/settings/settings_provider.dart';

class ShowThemeSheet extends StatelessWidget {
  const ShowThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<SettingsProvider>(context, listen: false);
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            methods.changeTheme(ThemeMode.dark);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  S.of(context).darkMode,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                provider.themeMode == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.onSurface,
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
            methods.changeTheme(ThemeMode.light);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  S.of(context).lightMode,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                provider.themeMode == ThemeMode.light
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.onSurface,
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
