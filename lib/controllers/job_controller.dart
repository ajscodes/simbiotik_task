import 'package:get/get.dart';
import '../models/job_model.dart';
import '../services/api_service.dart';

class JobController extends GetxController {
  final ApiService _apiService = ApiService();

  var allJobs = <JobModel>[].obs;
  var filteredJobs = <JobModel>[].obs;
  
  var isLoading = true.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    try {
      isLoading(true);
      hasError(false);
      errorMessage('');
      
      final jobs = await _apiService.fetchJobs();
      allJobs.assignAll(jobs);
      filteredJobs.assignAll(jobs);
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void filterJobs(String query) {
    if (query.isEmpty) {
      filteredJobs.assignAll(allJobs);
    } else {
      final lowerCaseQuery = query.toLowerCase();
      final filtered = allJobs.where((job) {
        return job.title.toLowerCase().contains(lowerCaseQuery) ||
               job.companyName.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      filteredJobs.assignAll(filtered);
    }
  }

  void toggleBookmark(JobModel job) {
    final indexAll = allJobs.indexOf(job);
    if (indexAll != -1) {
      allJobs[indexAll].isBookmarked = !allJobs[indexAll].isBookmarked;
      allJobs.refresh();
      filteredJobs.refresh();
    }
  }
}
