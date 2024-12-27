import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemarket/componants/DisplayCardSmall.dart';

import 'ItemDetailPage.dart';

class AppSearchPage extends StatefulWidget {
  @override
  _AppSearchPageState createState() => _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {
  List<dynamic> allData = [];
  List<dynamic> filteredData = [];
  List<String> recentSearches = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/Json/itemList.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      allData = data;
    });
  }

  void handleSearch(String input) {
    setState(() {
      query = input;
      if (input.isEmpty) {
        filteredData = [];
      } else {
        filteredData = allData
            .where((item) =>
            item['title'].toLowerCase().contains(input.toLowerCase()))
            .toList();
        print(filteredData);
      }
    });
  }

  void addRecentSearch(String search) {
    if (!recentSearches.contains(search)) {
      setState(() {
        recentSearches.add(search);
      });
    }
  }

  void clearRecentSearches() {
    setState(() {
      recentSearches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Back Button
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Search Bar
                Expanded(
                  child: TextField(
                    onChanged: (value) => handleSearch(value),
                    onSubmitted: (value) {
                      addRecentSearch(value);
                      handleSearch(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: query.isNotEmpty ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            query = "";
                            filteredData = [];
                          });
                        },
                      ) : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey), // Gray border on focus
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Recent Searches Section
            if (query.isEmpty && recentSearches.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Searches",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: clearRecentSearches,
                          child: Text(
                            "Clear All",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(recentSearches[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                recentSearches.removeAt(index);
                              });
                            },
                          ),
                          onTap: () {
                            handleSearch(recentSearches[index]);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),


          // Filtered Data Section
          if (query.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                   return Center(
                       child: Padding(
                         padding: EdgeInsets.all(15),
                         child: Container(
                           width: 170,
                           child: DisplayCardSmall(
                               height: 170,
                               imagePath:filteredData[index]['imagePath'] ,
                               title:filteredData[index]['title'],
                               onTap:(){
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                     builder: (context) => ItemDetailPage(item: filteredData[index]),
                                 ),
                                 );
                               } ,
                           ),
                         ),
                       )
                   );
                },
              ),
            ),

          // Empty State Section
          if (query.isEmpty && recentSearches.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  "You have no recent searches.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
