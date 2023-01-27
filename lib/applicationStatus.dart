import 'package:flutter/material.dart';

class ApplicationStatus extends StatefulWidget {
  const ApplicationStatus({Key? key}) : super(key: key);

  @override
  State<ApplicationStatus> createState() => _ApplicationStatusState();
}

class _ApplicationStatusState extends State<ApplicationStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Applications",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                EachApplication(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                    state: "APPLIED"
                ),
                EachApplication(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                    state: "APPLIED"
                ),
                EachApplication(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                    state: "APPLIED"
                ),
                EachApplication(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                    state: "APPLIED"
                ),
                EachApplication(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                    state: "APPLIED"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EachApplication extends StatefulWidget {
  const EachApplication({Key? key,
    required this.workBio,
    required this.employerUsername,
    required this.location,
    required this.salary,
    required this.time,
    required this.state}) : super(key: key);

  final workBio;
  final employerUsername;
  final location;
  final salary;
  final time;
  final state;

  @override
  State<EachApplication> createState() => _EachApplicationState();
}

class _EachApplicationState extends State<EachApplication> {
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
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${widget.state}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
