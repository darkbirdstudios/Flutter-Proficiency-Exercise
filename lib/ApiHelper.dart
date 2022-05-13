import 'dart:convert';

import 'package:flutter_proficiency_exercise/DataModel.dart';
import 'package:http/http.dart' as http;




class ApiHelper {

  final String host = "https://run.mocky.io/";
  final String apiVersion = "v3/";
  final String endpoint = "c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };



  getApiData() async{

    try{
      var respose = await http.get(Uri.parse(host + apiVersion + endpoint),headers: requestHeaders);
      if(respose.statusCode == 200)
        {
          return DataModel.fromJson(jsonDecode(respose.body));
        }else{
        return "error";
      }

    }catch(err){
      return "error";
    }

  }


}