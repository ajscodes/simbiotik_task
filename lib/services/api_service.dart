import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/job_model.dart';

class ApiService {
  static const String _baseUrl = 'https://www.arbeitnow.com/api/job-board-api';

  Future<List<JobModel>> fetchJobs() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> jobsJson = decodedData['data'] ?? [];
        
        return jobsJson.map((json) => JobModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load jobs. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching jobs: $e');
    }
  }
}
