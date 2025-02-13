import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


import '../../models/event_data.dart';

class FirebaseFirestoreService {

  static CollectionReference<EventData> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventData.collectionName)
        .withConverter<EventData>(
      fromFirestore: (snapshot, _) =>
          EventData.fromFirestore(snapshot.data()!),
      toFirestore: (eventData, _) => eventData.toFireStore(),
    );
  }

  static Future<bool> createNewEvent(EventData data) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc();
      data.eventId = docRef.id;
      docRef.set(data);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<List<EventData>> getDataFromFirestore() async {
    var collectionRef = getCollectionReference();
    QuerySnapshot<EventData> data = await collectionRef.get();

    List<EventData> eventDataList = data.docs.map(
          (element) {
        log(element.data().toFireStore().toString());
        return element.data();
      },
    ).toList();
    return eventDataList;
  }

  static Stream<QuerySnapshot<EventData>> getStreamFavoriteData() {
    var collectionRef = getCollectionReference().where(
      "Favorite",
      isEqualTo: true,
    );

    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getStreamData(
      String categoryName) {
    var collectionRef = getCollectionReference().where(
      "eventCategory",
      isEqualTo: categoryName,
    );

    return collectionRef.snapshots();
  }

  Future<bool> deleteEvent(EventData data) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc(data.eventId);

      docRef.delete();

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> updateEvent(EventData data) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc(data.eventId);

      docRef.update(
        data.toFireStore(),
      );

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}