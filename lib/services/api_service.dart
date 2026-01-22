import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/exam_model.dart';

class ApiService {
  static final String baseUrl = Platform.isAndroid
      ? 'https://health-api-0sv7.onrender.com'
      : 'http://localhost:18080';

  Future<List<ExamRecord>> getExams() async {
    final response = await http.get(
      Uri.parse('$baseUrl/exams'),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => ExamRecord.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> addExam(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/exams/add'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print("Server error: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Connection error: $e");
      return false;
    }
  }
}
