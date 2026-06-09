import '../entities/word.dart';

abstract class VocabularyRepository {
  Future<List<Word>> getWords();

  Future<void> saveWord(Word word);

  Future<List<Word>> getSavedWords();
}