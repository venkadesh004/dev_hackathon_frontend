import 'package:flutter/material.dart';
import 'package:dev_hackathon/categories.dart';
import 'package:dev_hackathon/workerProfile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Workers extends StatefulWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  State<Workers> createState() => _WorkersState();
}

class _WorkersState extends State<Workers> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "WORKERS",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
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
            ],
          ),
          body: const CategoriesPage()
      ),
    );
  }
}
