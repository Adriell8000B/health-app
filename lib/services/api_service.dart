import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/exam_model.dart';

class ApiService {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS/Web
  static final String baseUrl = Platform.isAndroid
      ? 'http://10.0.2.2:18080'
      : 'http://localhost:18080';

  Future<List<ExamRecord>> getExams() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      // Take only the first 10 items so the list isn't too long
      return body.take(10).map((item) => ExamRecord.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
