













import 'dart:convert';

import 'package:flutter_api/model/user.dart';
import 'package:http/http.dart' as http;

var host = 'http://192.168.1.107:8081';    //home
//var host = 'http://localhost:8081';       // crome
//var host = 'http://192.168.1.73:8081';   //saiful vai
//var host = 'http://192.168.1.22:8081';       //TSP

var signupApi = host+'/user/save';
var signinApi = host+'/user/login';
var getAllProductApi = host+'/product/getAll';
var search = host + '/product/search?searchText=';



Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signup(User user) async {

  final response = await http
      .post(Uri.parse(signupApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
  return  response;

}



Future<http.Response> signin(User user) async {


  final response = await http
      .post(Uri.parse(signinApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
  return  response;


}





Future<http.Response> getAllProduct() async {
  final response = await http
      .get(Uri.parse(getAllProductApi));
  return  response;

}



Future<http.Response> searchProduct(String value) async {
  final response = await http
      .get(Uri.parse(search+value));
  return  response;

}


















