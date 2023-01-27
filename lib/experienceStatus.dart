import 'package:flutter/material.dart';

class WorkStatus extends StatefulWidget {
  const WorkStatus({Key? key}) : super(key: key);

  @override
  State<WorkStatus> createState() => _WorkStatusState();
}

class _WorkStatusState extends State<WorkStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Works",
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
                EachWorks(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                ),
                EachWorks(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                ),
                EachWorks(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                ),
                EachWorks(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                ),
                EachWorks(
                    workBio: "Need field Workers",
                    employerUsername: "venkadesh",
                    location: "Chennai",
                    salary: "10000",
                    time: "50",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EachWorks extends StatefulWidget {
  const EachWorks({Key? key,
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
  State<EachWorks> createState() => _EachWorksState();
}

class _EachWorksState extends State<EachWorks> {
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
                    "COMPLETED",
                    style: TextStyle(
                        color: Colors.green,
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
