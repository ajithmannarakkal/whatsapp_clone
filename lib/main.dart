import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/settingsPage.dart';
import 'package:whatsapp/tabwidget.dart';

import 'models/users/datum.dart';
import 'models/users/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    Users usersListResponse = await loadUsers();
    setState(() {
      usersList = usersListResponse.data!;
    });
  }

  Future<Users> loadUsers() async {
    String url = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(url));
    var responsejson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Users.fromJson(responsejson);
    } else {
      throw Exception("no model created");
    }
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 136, 87),
          title: Text("Whatsapp"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("New group")),
                PopupMenuItem(child: Text("New broadcast")),
                PopupMenuItem(child: Text("Linked devices")),
                PopupMenuItem(child: Text("Starred messages")),
                PopupMenuItem(child: Text("Payments")),
                PopupMenuItem(child: Text("Settings"))
              ];
            })
          ],
          bottom: TabBar(tabs: [
            TabWidget(),
            Tab(text: 'CHATS'),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ]),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(usersList[index].avatar!),
                title: Text(usersList[index].firstName.toString()),
                subtitle: Text(
                    'Hello,it\'s me, ${usersList[index].firstName} ${usersList[index].lastName}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${usersList[index].id}:00 PM'),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 31, 136, 87),
                      child: Text('${usersList[index].id}'),
                      radius: 10,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: usersList.length),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 31, 136, 87),
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
      ),
    );
  }
}
