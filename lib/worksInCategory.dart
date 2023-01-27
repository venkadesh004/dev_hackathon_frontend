import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dev_hackathon/workerProfile.dart';
import 'package:http/http.dart' as http;

class Work {
  final String workID;
  final String employerUsername;
  final String category;
  final String salary;
  final String duration;
  final String location;
  final String bio;

  const Work({
    required this.workID,
    required this.employerUsername,
    required this.category,
    required this.salary,
    required this.duration,
    required this.location,
    required this.bio,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      workID: json['workID'],
      employerUsername: json['employerUsername'],
      category: json['category'],
      salary: json['salary'],
      duration: json['duration'],
      location: json['location'],
      bio: json['bio']
    );
  }
}

Future<Work> fetchAlbum(String data) async {
  final response = await http
      .get(Uri.parse('http://192.168.1.19:5000/work/getCategoryWorks/${data}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Work.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Works extends StatefulWidget {
  const Works({Key? key,
  required this.category}) : super(key: key);

  final category;

  @override
  State<Works> createState() => _WorksState();
}

class _WorksState extends State<Works> {

  late Future<Work> futureWork;

  @override
  void initState() {
    super.initState();
    futureWork = fetchAlbum(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    // getData(widget.category);
    // print(outputData);
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.height,
          child: FutureBuilder<Work>(
            future: futureWork,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasData) {
                return Container(
                  height: 140,
                  margin: const EdgeInsets.only(top: 10),
                  child: SingleWork(
                    workBio: snapshot.data!.bio,
                    employerUsername: snapshot.data!.employerUsername,
                    location: snapshot.data!.location,
                    salary: snapshot.data!.salary,
                    time: snapshot.data!.duration,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('No Work Found'));
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
          // child: Column(
          //   children: [
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     ),
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     ),
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     ),
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     ),
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     ),
          //     SingleWork(
          //       workBio: "Need workers for farming in corn fields!",
          //       employerUsername: "venkadesh",
          //       location: "Chennai",
          //       salary: "10000",
          //       time: "50",
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}

class SingleWork extends StatefulWidget {
  const SingleWork({Key? key,
  required this.workBio,
  required this.employerUsername,
  required this.location,
  required this.salary,
  required this.time}) : super(key: key);

  final workBio;
  final employerUsername;
  final location;
  final salary;
  final time;

  @override
  State<SingleWork> createState() => _SingleWorkState();
}

class _SingleWorkState extends State<SingleWork> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: const Offset(2, 2),
                blurRadius: 2.0,
                spreadRadius: 0
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    widget.employerUsername,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                      widget.workBio,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "${widget.location}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Rs ${widget.salary}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    "${widget.time} Hrs",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    child: Container(
                      width: 90,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 13
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



class WorksInCategory extends StatefulWidget {
  const WorksInCategory({Key? key, required this.title, required this.title_code}) : super(key: key);

  final title_code;
  final title;

  @override
  State<WorksInCategory> createState() => _WorksInCategoryState();
}

class _WorksInCategoryState extends State<WorksInCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10, top: 10),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerProfile()));
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                ),
              )
            ]
        ),
        body: Container(
          child: Works(category: widget.title_code,)
        ),
      ),
    );
  }
}
