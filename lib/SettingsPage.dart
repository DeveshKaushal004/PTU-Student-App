import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool receiveJobAlerts = true;
  bool receiveWhatsAppMessage = true;
  bool theme = false;
  String selectedLanguage = 'English'; // Default language
  // Define a list of available languages
  List<String> languageOptions = ['English', 'Hindi', 'Punjabi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Receive Job Alerts'),
              trailing: Switch(
                value: receiveJobAlerts,
                onChanged: (value) {
                  setState(() {
                    receiveJobAlerts = value;
                  });
                  // Implement the logic to update the user's preference
                },
              ),
            ),
            ListTile(
              title: Text('Receive WhatsApp Message'),
              trailing: Switch(
                value: receiveWhatsAppMessage,
                onChanged: (value) {
                  setState(() {
                    receiveWhatsAppMessage = value;
                  });
                  // Implement the logic to update the user's preference
                },
              ),
            ),
            Divider(),
            // Language Selection
            ListTile(
              title: Text('Dark Theme'),
              trailing: Switch(
                value: theme,
                onChanged: (value) {
                  setState(() {
                    theme = value;
                  });
                  // Implement the logic to update the user's preference
                },
              ),
            ),
            ListTile(
              title: Text('Language'),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                items: languageOptions.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue ?? selectedLanguage; // Use the selectedLanguage if newValue is null
                    // Implement logic to change the app's language here
                  });
                },
              ),
            ),
            // Account Settings
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                // Implement the logic to navigate to the profile editing page
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Implement the logic to navigate to the password change page
                Navigator.pushNamed(context, '/password_change');
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                // Implement the logic to sign the user out
                // Redirect to the login or home page
              },
            ),
          ],
        ),
      ),
    );
  }
}
