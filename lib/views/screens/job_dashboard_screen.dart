import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/job_controller.dart';
import '../widgets/job_card.dart';

class JobDashboardScreen extends StatelessWidget {
  final JobController controller = Get.put(JobController());

  JobDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('HireHub', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          //Search Bar
          Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: TextField(
              onChanged: (value) => controller.filterJobs(value),
              decoration: InputDecoration(
                hintText: 'Search by title or company...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          // Job Feed Content
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              
              if (controller.hasError.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.cloud_off, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'Oops! Network issue.',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          controller.errorMessage.value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => controller.fetchJobs(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Try Again'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              
              if (controller.filteredJobs.isEmpty) {
                return const Center(
                  child: Text('No jobs matched your search.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                itemCount: controller.filteredJobs.length,
                itemBuilder: (context, index) {
                  final job = controller.filteredJobs[index];
                  return JobCard(job: job);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
