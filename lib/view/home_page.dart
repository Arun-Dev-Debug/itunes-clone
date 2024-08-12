import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:root_checker_plus/root_checker_plus.dart';
import '../utils/assets.dart';
import 'media_page.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  ConsumerStatefulElement createElement() {
    if (Platform.isAndroid) {
      androidRootChecker();
    }
    if (Platform.isIOS) {
      iosJailbreak();
    }
    return super.createElement();
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> chipList = ["album", "movie", "musicVideo", "song"];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ItunesAssets.appleIcon,
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                  const Text(
                    'iTunes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Search for a variety of content from the iTunes store including iBooks, '
                'movies, podcast, music, music videos, and audiobooks.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: searchText,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter text here',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius for more or less curve
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade800,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade800,
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Specify the parameter for the content to be searched',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.grey.shade800,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: chipList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        searchText.clear();
                        searchText.text = searchText.text + chipList[index];
                      },
                      child: Chip(
                        label: Text(chipList[index]),
                        backgroundColor: Colors.grey,
                        shape: const StadiumBorder(),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade800),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity,
                        50), // Height can be adjusted as needed
                  ),
                ),
                onPressed: () async {
                  if (kDebugMode) {
                    print(searchText.text);
                  }
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediaPage(searchTerm: searchText.text,),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white), // Adjust text color if needed
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> androidRootChecker() async {
    bool  rootedCheck;
    try {
    rootedCheck = (await RootCheckerPlus.isRootChecker())!;
    } on PlatformException {
      rootedCheck = false;
    }
    if (kDebugMode) {
      print("Android rooted Check $rootedCheck");
    }

  }

  Future<void> iosJailbreak() async {
    bool jailbreak;
    try {
      jailbreak = (await RootCheckerPlus.isJailbreak())!;
    } on PlatformException {
      jailbreak = false;
    }
    if (kDebugMode) {
      print("Ios rooted Check $jailbreak");
    }
  }

}
