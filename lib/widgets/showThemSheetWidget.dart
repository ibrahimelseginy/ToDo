import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
                  'Darth mood',
                  style: GoogleFonts.elMessiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: provider.theme == ThemeMode.dark
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const Spacer(),
                provider.theme == ThemeMode.dark
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
                  'Light mood',
                  style: GoogleFonts.elMessiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: provider.theme == ThemeMode.light
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const Spacer(),
                provider.theme == ThemeMode.light
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
