import 'package:flutter/material.dart';
import 'package:dev_hackathon/applicationStatus.dart';
import 'package:dev_hackathon/experienceStatus.dart';
import 'package:http/http.dart' as http;
import 'package:dev_hackathon/constants.dart';
import 'dart:convert';

class Worker {
  final String name;
  final String dob;
  final String address;
  final String phone;
  final String email;
  final String username;

  const Worker({
    required this.name,
    required this.dob,
    required this.address,
    required this.phone,
    required this.email,
    required this.username
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
        name: json['name'],
        dob: json['dob'],
        address: json['address'],
        phone: json['phone'],
        email: json['email'],
        username: json['username']
    );
  }
}

Future<Worker> fetchAlbum() async {
  print(username);
  final response = await http
      .get(Uri.parse('http://192.168.1.19:5000/worker/${username}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Worker.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class WorkerProfile extends StatefulWidget {
  const WorkerProfile({Key? key}) : super(key: key);

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  late Future<Worker> futureWork;

  @override
  void initState() {
    super.initState();
    futureWork = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.black38,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<Worker>(
                    future: futureWork,
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.hasData) {
                        return Container(
                          height: 250,
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WorkerAttributes(heading: "Name", result: snapshot.data!.name),
                                WorkerAttributes(heading: "Username", result: snapshot.data!.username),
                                WorkerAttributes(heading: "DOB", result: snapshot.data!.dob),
                                WorkerAttributes(heading: "Address", result: snapshot.data!.address),
                                WorkerAttributes(heading: "Phone", result: snapshot.data!.phone),
                                WorkerAttributes(heading: "Email", result: snapshot.data!.email),
                          ]
                        )
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('No User Found'));
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     WorkerAttributes(heading: "Name", result: "S Venkadesh"),
                  //     WorkerAttributes(heading: "Username", result: "venkadesh"),
                  //     WorkerAttributes(heading: "DOB", result: "01-01-2004"),
                  //     WorkerAttributes(heading: "Address", result: "TCE Madurai"),
                  //     WorkerAttributes(heading: "Phone", result: "1234567890"),
                  //     WorkerAttributes(heading: "Email", result: "venkadesh@gmail.com"),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Applications",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplicationStatus()));
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(
                                    "Check Now",
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Works Done",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkStatus()));
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(
                                    "Check Now",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        );
  }
}

class WorkerAttributes extends StatefulWidget {
  const WorkerAttributes({Key? key,
  required this.heading,
  required this.result}) : super(key: key);

  final heading;
  final result;

  @override
  State<WorkerAttributes> createState() => _WorkerAttributesState();
}

class _WorkerAttributesState extends State<WorkerAttributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.heading,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18
            ),
          ),
          Text(
            widget.result,
            style: TextStyle(
                color: Colors.black38,
                fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}
