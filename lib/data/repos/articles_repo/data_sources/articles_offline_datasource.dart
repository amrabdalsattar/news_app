import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/articles_response.dart';

class ArticlesOfflineDataSource {
  Future<ArticlesResponse?> getArticle(String sourceId) async {
    CollectionReference articleCollection =
        FirebaseFirestore.instance.collection("articles");
    DocumentReference documentReference = articleCollection.doc(sourceId);

    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.data() == null) return null;
    return ArticlesResponse.fromJson(documentSnapshot.data());
  }

  void saveArticle(String sourceId, ArticlesResponse articlesResponse) {
    CollectionReference articleCollection =
        FirebaseFirestore.instance.collection("articles");
    DocumentReference documentReference = articleCollection.doc(sourceId);

    documentReference.set(articlesResponse.toJson());
  }
}
