import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView(
        children: <Widget>[
          JobListingCard(
            jobTitle: 'Software Engineer',
            company: 'TechCo Inc.',
            location: 'New York, NY',
            datePosted: '2 days ago',
          ),
          JobListingCard(
            jobTitle: 'Data Scientist',
            company: 'DataTech Solutions',
            location: 'San Francisco, CA',
            datePosted: '5 days ago',
          ),
          // Add more job listings as needed
        ],
      ),
    );
  }
}

class JobListingCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String datePosted;

  JobListingCard({
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.datePosted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(jobTitle),
        subtitle: Text(company),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(location),
            Text(datePosted),
          ],
        ),
        onTap: () {
          // Implement the logic to view the job details when the card is tapped
          // You can navigate to a job details page.
        },
      ),
    );
  }
}
