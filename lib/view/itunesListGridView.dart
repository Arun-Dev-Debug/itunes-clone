import 'package:flutter/material.dart';
import 'package:itunes/models/itunes_data_model.dart';

import '../utils/utils.dart';
import 'details_page.dart';

class ItunesListGridView extends StatefulWidget {
  Map<String, List<Results>> mediaMap = {};
  ItunesListGridView({super.key, required this.mediaMap});

  @override
  State<ItunesListGridView> createState() => _ItunesListGridViewState();
}

class _ItunesListGridViewState extends State<ItunesListGridView> {

  bool isGrid = true;
  bool isList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        title: const Text(
          'iTunes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isGrid = true;
                      isList = false;
                    });
                  },
                  style: (isGrid) ?ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                  ) : ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    elevation: 0, // removes elevation
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                  ),
                  child: const Text(
                    'Grid Layout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 45,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isGrid = false;
                      isList = true;
                    });
                  },
                  style: (isList) ? ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                  ) : ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    elevation: 0, // removes elevation
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                    ),
                  ) ,
                  child: const Text(
                    'List Layout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.mediaMap.keys.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey.shade800,
                        child: Text(
                          toCapitalCase(widget.mediaMap.keys.elementAt(i)),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      (isGrid == true) ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: .6
                        ),
                        itemCount : widget.mediaMap.values.elementAt(i).length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(mediaResult: widget.mediaMap.values.elementAt(i)[index]),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                                  child: Image.network(
                                    scale: .6,
                                    widget.mediaMap.values.elementAt(i)[index].artworkUrl100.toString(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      widget.mediaMap.values.elementAt(i)[index].trackName.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ) :
                      ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.mediaMap.values.elementAt(i).length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(mediaResult: widget.mediaMap.values.elementAt(i)[index]),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                                child: Image.network(
                                  scale: .6,
                                    widget.mediaMap.values.elementAt(i)[index].artworkUrl100.toString()
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    widget.mediaMap.values.elementAt(i)[index].trackName.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
