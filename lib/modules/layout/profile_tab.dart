

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evently_app/core/extension/padding.dart';

import 'package:evently_app/modules/layout/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../core/theme/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQuery.size.height * 0.25,
            width: double.infinity,
            padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              color:AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color:AppColors.wity,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                      bottomRight: Radius.circular(1000),
                      topRight: Radius.circular(1000),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset("assets/icons/route_logo.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nesreen Amr ",
                        style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.wity,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "nesreenamrpersonal@gmail.com",
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.wity,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Language",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              CustomDropdown<String>(
                hintText: provider.currentLanguage == "en" ? "English" : "عربي",
                items: provider.languagesList,
                onChanged: (value) {
                  if (value == "English") {
                    provider.setCurrentLanguage("en");
                  }
                  if (value != "English") {
                    provider.setCurrentLanguage("ar");
                  }
                },
                decoration: CustomDropdownDecoration(
                  closedBorder:
                  Border.all(color: AppColors.primary, width: 1.8),
                  closedBorderRadius: BorderRadius.circular(18.0),
                  closedSuffixIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 28,
                    color:  AppColors.primary,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.04,
              ),
              Text(
                "Theme Mode",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              CustomDropdown<String>(
                hintText: provider.isDark() ? "Dark" :
                "Light",
                items: provider.themeList,
                onChanged: (value) {
                  if (value == "Dark") provider.setCurrentTheme(ThemeMode.dark);
                  if (value == "Light") {
                    provider.setCurrentTheme(ThemeMode.light);
                  }
                },
                decoration: CustomDropdownDecoration(
                  closedBorder:
                  Border.all(color: AppColors.primary, width: 1.8),
                  closedBorderRadius: BorderRadius.circular(18.0),
                  closedSuffixIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 28,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ).setHorizontalPadding(context, 0.035),
        ],
      ),
    );
  }
}