import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:evently_app/core/extension/padding.dart';
import 'package:flutter/material.dart';


import '../../core/services/firebase_firestore_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text.dart';
import '../../models/event_data.dart';
import 'home/widgets/event_card.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          const CustomTextField(
            hint: "Search For Event",
            hintColor: AppColors.greyy,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.greyy,
            ),
          ).setHorizontalPadding(context, 0.02),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          StreamBuilder<QuerySnapshot<EventData>>(
            stream: FirebaseFirestoreService.getStreamFavoriteData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text(
                      "Something went wrong",
                    ),
                    const SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh_outlined,
                        color: AppColors.primary,
                      ),
                    )
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }

              List<EventData> eventDataList = snapshot.data!.docs.map(
                    (element) {
                  return element.data();
                },
              ).toList();

              return eventDataList.isNotEmpty
                  ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) =>
                    EventCard(
                  eventData: eventDataList[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: eventDataList.length,
              )
                  : Text(
                "No Event Created Yet!",
                style: theme.textTheme.titleLarge,
              );
            },
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
        ],
      ),
    );
  }
}