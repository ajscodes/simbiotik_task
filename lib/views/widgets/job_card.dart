import 'package:flutter/material.dart';
import '../../models/job_model.dart';
import '../../controllers/job_controller.dart';
import 'package:get/get.dart';
import '../screens/job_detail_screen.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  final JobController controller = Get.find();

  JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Get.to(() => JobDetailScreen(job: job));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      job.companyName,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16, color: Colors.blueAccent),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            job.location,
                            style: const TextStyle(fontSize: 14, color: Colors.blueAccent),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Bookmark Button
              IconButton(
                icon: Icon(
                  job.isBookmarked ? Icons.favorite : Icons.favorite_border,
                  color: job.isBookmarked ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  controller.toggleBookmark(job);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
