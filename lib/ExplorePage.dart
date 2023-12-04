import 'package:flutter/material.dart';
class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Jobs'),
      ),
      body: JobList(),
    );//ptu hostel
    }
}

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  List<Job> jobs = [
    Job(
      title: 'Software Engineer',
      company: '',
      location: '',
      datePosted: '',
    ),
    Job(
      title: 'Data Scientist',
      company: '',
      location: '',
      datePosted: '',
    ),
    // Add more job listings as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return JobCard(job: job);
      },
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(job.title),
        subtitle: Text('${job.company} - ${job.location} - ${job.datePosted}'),
        onTap: () {
          // Implement logic to navigate to the job details page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetailsPage(job: job)));
        },
      ),
    );
  }
}

class Job {
  final String title;
  final String company;
  final String location;
  final String datePosted;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.datePosted,
  });
}
