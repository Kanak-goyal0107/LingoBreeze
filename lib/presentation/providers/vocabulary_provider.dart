import 'package:flutter/material.dart';

import '../../domain/entities/word.dart';
import '../../domain/repositories/vocabulary_repository.dart';

class VocabularyProvider extends ChangeNotifier {
  final VocabularyRepository repository;

  VocabularyProvider({
    required this.repository,
  });

  bool isLoading = false;

  String? error;

  // Words saved in Firestore
  List<Word> savedWords = [];

  // Words fetched from Node.js API
  List<Word> apiWords = [];

  // Controllers
  final TextEditingController wordController =
  TextEditingController();

  final TextEditingController meaningController =
  TextEditingController();

  final TextEditingController translationController =
  TextEditingController();

  /// Fetch words from Firestore
  Future<void> getSavedWords() async {
    try {
      isLoading = true;
      notifyListeners();

      savedWords =
      await repository.getSavedWords();

      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  /// Fetch words from Node.js API
  Future<void> getApiWords() async {
    try {
      isLoading = true;
      notifyListeners();

      apiWords =
      await repository.getWords();

      error = null;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  /// Save word to Firebase
  Future<void> saveWord(Word word) async {
    try {
      await repository.saveWord(word);

      await getSavedWords();

      error = null;
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  /// Save API word directly to Firebase
  Future<void> saveApiWord(Word word) async {
    try {
      await repository.saveWord(word);

      await getSavedWords();

      error = null;
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  /// Clear form fields
  void clearFields() {
    wordController.clear();
    meaningController.clear();
    translationController.clear();
  }

  @override
  void dispose() {
    wordController.dispose();
    meaningController.dispose();
    translationController.dispose();
    super.dispose();
  }
}