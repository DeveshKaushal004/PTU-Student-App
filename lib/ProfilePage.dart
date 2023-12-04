import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://example.com/your_profile_image.jpg',
              ), // Replace with your profile image URL
            ),
            SizedBox(height: 16),
            Text(
              'Name', // Replace with the user's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Job Title', // Replace with the user's job title
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'About Me:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Write a short description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Skills:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Skill 1')),
                Chip(label: Text('Skill 2')),
                Chip(label: Text('Skill 3')),
                Chip(label: Text('Skill 4')),
                // Add more skills here
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Experience:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ExperienceItem(
              jobTitle: 'Job title',
              company: 'Company',
              dateRange: 'timeline',
              description: 'role',
            ),
            ExperienceItem(
              jobTitle: 'Title',
              company: 'Company',
              dateRange: 'timeline',
              description: 'role',
            ),
            // Add more experience items here
          ],
        ),
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String dateRange;
  final String description;

  ExperienceItem({
    required this.jobTitle,
    required this.company,
    required this.dateRange,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            jobTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(company),
          Text(dateRange),
          Text(description),
        ],
      ),
    );
  }
}
