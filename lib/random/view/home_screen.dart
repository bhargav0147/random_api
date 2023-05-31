import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api/random/provider/random_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomProvider? randomProviderFalse;
  RandomProvider? randomProviderTrue;

  @override
  void initState() {
    Provider.of<RandomProvider>(context, listen: false).jsonGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    randomProviderFalse = Provider.of<RandomProvider>(context, listen: false);
    randomProviderTrue = Provider.of<RandomProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Text(
                "Random Info",
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'pop'),
              ),
              actions: [
                TextButton(onPressed: () {
                  randomProviderFalse!.jsonGet();
                }, child: Text("Next",style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'pop'),))
              ],
            ),
            body: randomProviderTrue!.randomModal == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Center(
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${randomProviderFalse!.randomModal!.results![0].picture!.large}",
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/user.png",
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Name :- ${randomProviderFalse!.randomModal!.results![0].name!.title} ${randomProviderFalse!.randomModal!.results![0].name!.first} ${randomProviderFalse!.randomModal!.results![0].name!.last}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Gender :- ${randomProviderFalse!.randomModal!.results![0].gender}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Age :- ${randomProviderFalse!.randomModal!.results![0].dob!.age}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Phone :- ${randomProviderFalse!.randomModal!.results![0].phone}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Email :- ${randomProviderFalse!.randomModal!.results![0].email}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "City :- ${randomProviderFalse!.randomModal!.results![0].location!.city}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "State :- ${randomProviderFalse!.randomModal!.results![0].location!.state}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Country :- ${randomProviderFalse!.randomModal!.results![0].location!.country}",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'pop'),
                          )
                        ],
                      ),
                    ),
                  )));
  }
}
