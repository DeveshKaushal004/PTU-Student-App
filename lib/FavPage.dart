import 'package:flutter/material.dart';
import 'job.dart'; // Import your job class or data model

class FavPage extends StatefulWidget {
  final List<Job> favoriteJobs; // Replace 'Job' with your job data model

  FavPage({required this.favoriteJobs});

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  String filter = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Jobs'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Show a search bar to filter jobs
              showSearch(
                context: context,
                delegate: JobSearch(widget.favoriteJobs),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filter = value;
                });
              },
              decoration: InputDecoration(labelText: 'Search'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.favoriteJobs.length,
              itemBuilder: (context, index) {
                Job job = widget.favoriteJobs[index]; // Replace 'Job' with your job data model
                if (job.title.toLowerCase().contains(filter.toLowerCase())) {
                  return ListTile(
                    title: Text(job.title),
                    subtitle: Text(job.company),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
                      onPressed: () {
                        // Implement logic to remove job from favorites
                        setState(() {
                          widget.favoriteJobs.remove(job);
                        });
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JobSearch extends SearchDelegate<Job> {
  final List<Job> jobs;

  JobSearch(this.jobs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        Job job = jobs[index];
        if (job.title.toLowerCase().contains(query.toLowerCase())) {
          return ListTile(
            title: Text(job.title),
            subtitle: Text(job.company),
            onTap: () {
              close(context, job);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
