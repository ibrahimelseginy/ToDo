import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
            methods.changLanguage('en');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'English',
                  style: GoogleFonts.elMessiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: provider.language == 'en'
                        ? Theme.of(context).primaryColor
                        : const Color(0xff242424),
                  ),
                ),
                const Spacer(),
                provider.language == 'en'
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
            methods.changLanguage('ar');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'عربي',
                  style: GoogleFonts.elMessiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: provider.language == 'ar'
                        ? Theme.of(context).primaryColor
                        : const Color(0xff242424),
                  ),
                ),
                const Spacer(),
                provider.language == 'ar'
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
