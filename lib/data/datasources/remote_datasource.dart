import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/app_constants.dart';
import '../models/word_model.dart';

class RemoteDatasource {
  Future<List<WordModel>> getWords() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/words'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
      jsonDecode(response.body);

      return jsonData
          .map(
            (item) => WordModel.fromJson(item),
      )
          .toList();
    } else {
      throw Exception('Failed to load words');
    }
  }
}