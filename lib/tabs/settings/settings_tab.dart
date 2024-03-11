import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/widgets/showLanguagesheetWidget.dart';
import 'package:todoapp/widgets/showThemSheetWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: GoogleFonts.elMessiri(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
            ),
            child: InkWell(
              onTap: () {
                showLanguageSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Provider.of<MyProvider>(context).language == 'en'
                        ? 'English'
                        : 'عربي',
                    style: GoogleFonts.elMessiri(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Text(
            'Themeing',
            style: GoogleFonts.elMessiri(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
            ),
            child: InkWell(
              onTap: () {
                showThemeSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? 'Light mood'
                        : 'Dark mood',
                    style: GoogleFonts.elMessiri(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowLanguageSheet();
      },
    );
  }

  void showThemeSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowThemeSheet();
      },
    );
  }
}
