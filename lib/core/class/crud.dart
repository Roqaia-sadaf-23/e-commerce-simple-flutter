import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/functions/checkinternet.dart';

class crud {
  Future<Either<StatusRecuest, List<dynamic>>> getData(String url) async {
    try {
     if (await checkinternet()) {
        var response = await http.get(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
        );

        print("GET Status Code: ${response.statusCode}");
        print("GET Response Body: ${response.body}");

        if (response.statusCode == 200) {
          List<dynamic> responseebody = jsonDecode(response.body);
          return Right(responseebody);
        } else {
          return Left(StatusRecuest.serverFailure);
        }
      } 
      else
       {
        return Left(StatusRecuest.offlineFailure);
      }
    } catch (e) {
      print("GET Exception: $e");
      return Left(StatusRecuest.serverFailure);
    }
  }

Future<Either<StatusRecuest,Map>> getDataWmap(String url) async {
    try {
      if (await checkinternet()) {
        var response = await http.get(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
        );

        print("GET Status Code: ${response.statusCode}");
  

        if (response.statusCode == 200) {
          var responseebody = jsonDecode(response.body);
                print("GET Iteemss ResponseMap Body: ${response.body}");
          return Right(responseebody);
        } else {
          return Left(StatusRecuest.serverFailure);
        }
      } else {
        return Left(StatusRecuest.offlineFailure);
      }
    } catch (e) {
      print("GET Exception: $e");
      return Left(StatusRecuest.serverFailure);
    }
  }

  /* 
  Future<Either<StatusRecuest, List<dynamic>>> postData(
    String Linkurl,
    List data,
  ) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(
          Uri.parse(Linkurl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data), // ← هذا مهم جداً
        );

        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          List<dynamic> responseebody = jsonDecode(response.body);
          return Right(responseebody);
        } else {
          return Left(StatusRecuest.serverFailure);
        }
      } else {
        return Left(StatusRecuest.offlineFailure);
      }
    } catch (e) {
      print("Exception: $e");
      return Left(StatusRecuest.serverFailure);
    }
  }

 */

  Future<Either<StatusRecuest, Map>> postData(
    String Linkurl,
    Map<String, dynamic> data,
  ) async {
    try {
    if (await checkinternet()) {
        var response = await http.post(
          Uri.parse(Linkurl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data), // 👍 هنا يتم تحويل map إلى JSON
        );

        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return Left(StatusRecuest.serverFailure);
        }
      } else {
        return Left(StatusRecuest.offlineFailure);
      }
    } catch (e) {
      print("Exception: $e");
      return Left(StatusRecuest.serverException);
    }
  }
  //put

  Future<Either<StatusRecuest, Map>> putData(
    String Linkurl,
    Map<String, dynamic> data,
  ) async {
    try {
     if (await checkinternet()) {
        var response = await http.put(
          Uri.parse(Linkurl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data), // 👍 هنا يتم تحويل map إلى JSON
        );

        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return Left(StatusRecuest.serverFailure);
        }
     } else {
        return Left(StatusRecuest.offlineFailure);
      } 
    } catch (e) {
      print("Exception: $e");
      return Left(StatusRecuest.serverException);
    }
  }



Future<Either<StatusRecuest, String>> deleteData(String linkUrl) async {
  try {
 if (await checkinternet()) {
      var response = await http.delete(
        Uri.parse(linkUrl),
        headers: {"Content-Type": "application/json"},
      );

      print("DELETE Status Code: ${response.statusCode}");
      print("DELETE Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        //var responseBody = jsonDecode(response.body);
        return Right(response.body);
      } else {
        return Left(StatusRecuest.serverFailure);
      }
    } else {
      return Left(StatusRecuest.offlineFailure);
    }
  } catch (e) {
    print("DELETE Exception: $e");
    return Left(StatusRecuest.serverException);
  }
}




}
