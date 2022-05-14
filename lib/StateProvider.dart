import 'package:flutter/cupertino.dart';
import 'package:flutter_proficiency_exercise/ApiHelper.dart';
import 'package:flutter_proficiency_exercise/DataModel.dart';

class StateProvider extends ChangeNotifier {

  final ApiHelper _apiHelper = ApiHelper();

  List<RowList> listData = [];
  late DataModel apiData;
  var error;


  void getData() async {
    try {
      var data = await _apiHelper.getApiData();
      if(data == 'error')
        {
          error = 'Error loading data';
          notifyListeners();
        }
      else{
        apiData = data;
        listData = apiData.rows;
        notifyListeners();
      }

    } catch (e) {
      print(e);
    }
  }

  Future<void> onRefresh()async {
    RowList data = RowList(
      title: "new data ${listData.length}",
      description: "new Data added after refresh",
      imageHref: null
    );
    listData.insert(0,data);
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }

  void searchFilter(String enteredKeyword) {
    List<RowList> results = [];
    if (enteredKeyword.isEmpty) {
      results = apiData.rows;
    } else {
      results = apiData.rows
          .where((user) =>
          user.title.toString().toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    if(results.isEmpty)
      {
        error = 'Data not found';
      }
    listData = results;
    notifyListeners();
  }



}