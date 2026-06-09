import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/word_model.dart';

class FirebaseDatasource {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<void> saveWord(WordModel word) async {
    try {
      final existingWords =
      await firestore
          .collection('vocabulary')
          .where(
        'word',
        isEqualTo: word.word,
      )
          .get();

      if (existingWords.docs.isNotEmpty) {
        return;
      }

      await firestore
          .collection('vocabulary')
          .add(word.toJson());
    } catch (e) {
      throw Exception(
        'Failed to save word: $e',
      );
    }
  }

  Future<List<WordModel>> getSavedWords() async {
    try {
      final QuerySnapshot<Map<String, dynamic>>
      snapshot =
      await firestore
          .collection('vocabulary')
          .get();

      return snapshot.docs.map((doc) {
        return WordModel.fromJson(
          doc.data(),
        );
      }).toList();
    } catch (e) {
      throw Exception(
        'Failed to fetch words: $e',
      );
    }
  }

  Future<void> deleteWord(
      String documentId,
      ) async {
    await firestore
        .collection('vocabulary')
        .doc(documentId)
        .delete();
  }
}