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
    super.initState();
  Provider.of<RandomProvider>(context,listen: false).jsonGet();
  }
  @override
  Widget build(BuildContext context) {
    randomProviderFalse =   Provider.of<RandomProvider>(context,listen: false);
    randomProviderTrue =   Provider.of<RandomProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Random Info",style: TextStyle(letterSpacing: 1,),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            randomProviderFalse!.jsonGet();
          }, icon: Icon(Icons.refresh,color: Colors.white,))
          ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Center(child: Text("${snapshot.hasError}"));
            }
          else if(snapshot.hasData)
            {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage("${randomProviderFalse!.randomModal!.results![0].picture!.large}"),
                  )
                ],
              );
            }
          else{
            return Center(child: CircularProgressIndicator(color: Colors.black,));
          }
        },
        future: randomProviderFalse!.jsonGet(),
      )
    ));
  }
}
