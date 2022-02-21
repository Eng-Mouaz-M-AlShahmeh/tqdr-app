// Developed by: Eng Mouaz M. Al-Shahmeh
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Api {
  String baseURL = 'https://tqdr.com.sa/api';
  String key =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdHFkci5jb20uc2FcL2FwaVwvbG9naW4iLCJpYXQiOjE2Mzc3NjcyODgsImV4cCI6MTYzNzc2OTA4OCwibmJmIjoxNjM3NzY3Mjg4LCJqdGkiOiJ6azRLYnJ3T0FRTUdicnNPIiwic3ViIjoxMiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.jrj22YPlVZKR6l04IkzgX67ZuaQN50GGiLCeUtwzMtA';

  Future<dynamic> getAllStores(BuildContext context) async {
    Uri? url = Uri.tryParse('$baseURL/store');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> getAllServiceProviders(BuildContext context) async {
    Uri? url = Uri.tryParse('$baseURL/serviceprovider');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> getAllServiceProvidersSearch(BuildContext context, String? keySearch) async {
    Uri? url = Uri.tryParse('$baseURL/serviceprovider/search');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
          'key_search': keySearch,
        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else if(response.statusCode == 204){
      await Fluttertoast.showToast(
        msg: ' عذراً لا يوجد نتائج تطابق بحثك عن $keySearch !',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> invoiceInquiry(BuildContext context, String? id) async {
    Uri? url = Uri.tryParse('$baseURL/invoice/inquiry');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
          'id': id,
        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else if(response.statusCode == 404){
      await Fluttertoast.showToast(
        msg: 'عذراً هذا الإيصال غير موجود!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else if(response.statusCode == 204){
      await Fluttertoast.showToast(
        msg: 'عذراً هذا الإيصال غير صالح!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> invoiceLink(BuildContext context, String? link) async {
    Uri? url = Uri.tryParse('$baseURL/invoiceorderlink');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
          'link': link,

        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else if(response.statusCode == 404){
      await Fluttertoast.showToast(
        msg: 'عذراً هذا الرابط غير موجود!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else if(response.statusCode == 204){
      await Fluttertoast.showToast(
        msg: 'عذراً هذا الرابط غير صالح!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> invoicePay(
      BuildContext context,
      String? amount,
      String? phone,
      String? store,
      Map orderNumber,
      ) async {
    Uri? url = Uri.tryParse('$baseURL/invoiceorder/pay');
    Map data = {
      'apikey': key,
      'amount': amount,
      'phone': phone,
      'store': store,
      'order_number': orderNumber,
    };
    var body = json.encode(data);
    var response = await http.post(
        url!,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS",
          "Connection": "keep-alive",
          "Accept-Encoding": "gzip, deflate, br"
        },
        body: body
    );

    if (response.statusCode == 200) {
      // var jsonx = json.decode(response.body);
      // return jsonx['message'];
      return 'عملية ناجحة';
    } else if(response.statusCode == 400) {
      var jsonx = json.decode(response.body);
      await Fluttertoast.showToast(
        msg: "${jsonx['message']}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else if(response.statusCode == 422) {
      var jsonx = json.decode(response.body);
      await Fluttertoast.showToast(
        msg: "${jsonx['message']}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<dynamic> getSearchStores(BuildContext context, String? searchKey) async {
    Uri? url = Uri.tryParse('$baseURL/store/search');
    var response = await http.post(
        url!,
        headers: {},
        body: {
          'apikey': key,
          'search_key': searchKey,
        }
    );

    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      return jsonx['data'];
    } else {
      await Fluttertoast.showToast(
        msg: 'هناك خطأ راجع الدعم الفني',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

}
