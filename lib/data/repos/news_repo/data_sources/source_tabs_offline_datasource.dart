import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/data/model/sources_response.dart';

class OfflineDataSource {
  Future<SourcesResponse?> getSources(String categoryId) async {
    CollectionReference tabsCollection =
        FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = tabsCollection.doc(categoryId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.data() == null) return null;
    return SourcesResponse.fromJson(documentSnapshot.data());
  }

  void saveSources(SourcesResponse sourcesResponse, String categoryId) {
    CollectionReference tabsCollection =
        FirebaseFirestore.instance.collection("tabs");
    DocumentReference documentReference = tabsCollection.doc(categoryId);
    documentReference.set(sourcesResponse.toJson());
  }
}
