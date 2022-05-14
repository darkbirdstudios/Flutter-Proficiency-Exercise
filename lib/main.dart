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
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StateProvider controller;
  @override
  void initState() {

    controller = Provider.of<StateProvider>(context,listen: false);
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  onChanged: (value){
                    Provider.of<StateProvider>(context,listen: false).searchFilter(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(4),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
        body: Consumer<StateProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return provider.listData.isEmpty
                ? provider.error != null ? Center(child: Text(provider.error.toString())) :const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: (){
                      return provider.onRefresh();
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(provider.apiData.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              itemCount: provider.listData.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 8,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                          backgroundImage:NetworkImage(provider.listData[index].imageHref.toString()),
                                          onBackgroundImageError: (error, stackTrace) {
                                          },
                                          backgroundColor: provider.listData[index].imageHref == null ?Colors.grey:Colors.white,
                                          radius: 30,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.all(8),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    130,
                                                child: Text(
                                                  provider
                                                      .listData[index].title
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Container(
                                                margin: const EdgeInsets.all(8),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    130,
                                                child: Text(provider
                                                    .listData[index]
                                                    .description
                                                    .toString())),
                                          ],
                                        )
                                      ],
                                    ));
                              }),
                        ),
                      ],
                    ));
          },
        ));
  }
}
