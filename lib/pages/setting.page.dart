import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipes/pages/profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: const Text(
              'Language',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.language),
            trailing: Text(
              'English',
              style: TextStyle(color: Colors.orange[600], fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
