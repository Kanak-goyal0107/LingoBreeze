import '../../domain/entities/word.dart';

class WordModel extends Word {
  const WordModel({
    required super.word,
    required super.meaning,
    required super.translation,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'],
      meaning: json['meaning'],
      translation: json['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'meaning': meaning,
      'translation': translation,
    };
  }
}