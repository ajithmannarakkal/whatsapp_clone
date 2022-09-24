import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 136, 87),
          leading: BackButton(),
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 35,
                child: Text("AM"),
              ),
              title: Text(
                "ajith",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                "β",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.qr_code),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.key),
              title: Text("Account"),
              subtitle: Text("Privacy, security, change number"),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("Chats"),
              subtitle: Text("Theme, walpapers, chat history"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              subtitle: Text("message, group & call tones"),
            ),
            ListTile(
              leading: Icon(Icons.refresh),
              title: Text("Storage and data"),
              subtitle: Text("Network usage, auto-download"),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("App language"),
              subtitle: Text("English (phone's language)"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              subtitle: Text("Help center, contact us, privacy policy"),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Invite a friend"),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text("from"),
                Text(
                  "∞ Meta",
                  style: TextStyle(color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
