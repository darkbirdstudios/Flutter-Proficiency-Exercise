import 'package:flutter/material.dart';
import 'package:flutter_proficiency_exercise/StateProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StateProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:30,vertical: 10),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.search_rounded,color: Colors.white,)
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 1), () {});
          },
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: ListTile(
                    title: Text("dsfsdfsdfdsf"),
                    subtitle: Text(
                        "dvvfghgfhgfkhgfjkhjgfjhljkglfhjdsfsdfsdfsdfsdfdsfsdfsdfsdffsfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdffgfhgjflkhjgfjlhkgfjhjgflkhjlkgflkhjklgfjhjgflkhjkgfklhjlkgfjhlkgflhjlkfgjhlkjgfkhjklgfhklgfhlkjgflkh"),
                  ),
                );
              })),
    );
  }
}
