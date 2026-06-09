import '../../domain/entities/word.dart';
import '../../domain/repositories/vocabulary_repository.dart';
import '../datasources/firebase_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/word_model.dart';

class VocabularyRepositoryImpl
    implements VocabularyRepository {
  final FirebaseDatasource firebaseDatasource;
  final RemoteDatasource remoteDatasource;

  VocabularyRepositoryImpl({
    required this.firebaseDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<List<Word>> getWords() async {
    return await remoteDatasource.getWords();
  }

  @override
  Future<void> saveWord(Word word) async {
    await firebaseDatasource.saveWord(
      WordModel(
        word: word.word,
        meaning: word.meaning,
        translation: word.translation,
      ),
    );
  }

  @override
  Future<List<Word>> getSavedWords() async {
    return await firebaseDatasource.getSavedWords();
  }
}