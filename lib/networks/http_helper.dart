
import 'dart:convert';

import 'package:flutter_api/model/user.dart';
import 'package:http/http.dart' as http;

var host = 'http://192.168.1.107:8081';    //home


var registrationApi = host+'/user/save';
var loginApi = host+'/user/login';
var getAllProductApi = host+'/product/getAll';




Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> registration(User user) async {

  final response = await http
      .post(Uri.parse(registrationApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
  return  response;

}



Future<http.Response> login(User user) async {


  final response = await http
      .post(Uri.parse(loginApi),headers: requestHeaders,body: jsonEncode(user.toMap()));
  return  response;


}





Future<http.Response> getAllProduct() async {
  final response = await http
      .get(Uri.parse(getAllProductApi));
  return  response;

}
























