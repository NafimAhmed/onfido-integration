



import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onfido_sdk/onfido_sdk.dart';

// import '../../../util/app_constant.dart';
// import '../../../widgets/app_snackbar.dart';
// import '../views/onfido_page.dart';

class DocumentVarificationProvider {






  Future<bool> createOnfidoApplicant(String firstName,String lastName,String birthDay,String town,String postCode) async {
    //Map<String,String> userData = {};
   // userData['phone_number'] = phoneNumber;

    // String fname="afi";
    // String lname="afim";


    final url = Uri.parse('https://api.eu.onfido.com/v3.6/applicants/');


    // debugPrint("----------------------------first Name--------------------------${fname}");
    // debugPrint("----------------------------last Name--------------------------${lname}");




    var response = await http.post(url, body: json.encode( {
      "first_name":firstName,
      "last_name":lastName,
      "dob":"1999-01-31",
      "address":{
        "building_number": "100",
        "street": "Main Street",
        "town": "London",
        "postcode": "SW4 6EH",
        "country": "GBR"
      }
    }),
      headers: {
      'Authorization':'Token token=api_sandbox.8LzLny9RZn-.KyDHrKg_jappQTw3cdDX9kCHSLvaJbuF',
        "content-type" : "application/json",
        "accept" : "application/json"
        //'Cookie':'_mkra_stck=e1f676449209c3dcd3ad126c08650d7f%3A1711004208.8912394'
      }


    );

    debugPrint("----------------------------Response code--------------------------${response.statusCode}");
    debugPrint("----------------------------Response data--------------------------${response.body}");
    //debugPrint("----------------------------User id--------------------------${json.decoder()}");


    if (response.statusCode == 201) {

      var jsonResponse = json.decode(response.body);

      debugPrint("----------------------------user Id--------------------------${jsonResponse["id"]}");
      createOnfidoSdkToken("${jsonResponse["id"]}");

      return true;

    } else {

      return false;
    }
  }










  Future<bool> createOnfidoSdkToken(String applicanID) async {
    // Map<String,String> userData = {};
    // userData['phone_number'] = phoneNumber;



    final url = Uri.parse('https://api.eu.onfido.com/v3.6/sdk_token');



    var response = await http.post(url, body: {
      "applicant_id": applicanID,
      "application_id": "com.example.onfido",
    },
        headers: {
          'Authorization':'Token token=api_sandbox.8LzLny9RZn-.KyDHrKg_jappQTw3cdDX9kCHSLvaJbuF',
          // "content-type" : "application/json",
          // "accept" : "application/json"
          // 'Content-Type':'application/json',
          // 'Cookie':'_mkra_stck=e1f676449209c3dcd3ad126c08650d7f%3A1711004208.8912394'
        }


    );

    debugPrint("-----------------------------------------------${response.body}");
    debugPrint("-----------------------------------------------${response.statusCode}");

    if (response.statusCode >= 200) {


      debugPrint("-----------------------------------------------${response.body}");


      var jsonResponse = json.decode(response.body);

      debugPrint("----------------------------SDK Token--------------------------${jsonResponse["token"]}");
      //createOnfidoSdkToken("${jsonResponse["id"]}");

      await startOnfido("${jsonResponse["token"]}");

      // Get.to(OnfidoPage(onfido: Onfido(
      //     sdkToken: "eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE3MTE2MDY1MjQsInBheWxvYWQiOnsiYXBwIjoiOGY5NGFkMWMtODFjYS00ZmViLTg0NGUtYjYyYWNkZWNiNDZhIiwiYXBwbGljYXRpb25faWQiOiJjb20ucHNsLnBfcGF5LnBfcGF5IiwiY2xpZW50X3V1aWQiOiI3NjgyNDZhYy1iZmIyLTQ3MGQtYWEyMi0xZTlmYjMyMDM1NDQiLCJpc19zYW5kYm94Ijp0cnVlLCJpc19zZWxmX3NlcnZpY2VfdHJpYWwiOnRydWUsImlzX3RyaWFsIjp0cnVlLCJzYXJkaW5lX3Nlc3Npb24iOiI4MmE5ZjkxZS0yNjBiLTQ4YjMtOTEzNS01NWU0ZmRlNzk3N2MifSwidXVpZCI6InBsYXRmb3JtX3N0YXRpY19hcGlfdG9rZW5fdXVpZCIsInVybHMiOnsiZGV0ZWN0X2RvY3VtZW50X3VybCI6Imh0dHBzOi8vc2RrLm9uZmlkby5jb20iLCJzeW5jX3VybCI6Imh0dHBzOi8vc3luYy5vbmZpZG8uY29tIiwiaG9zdGVkX3Nka191cmwiOiJodHRwczovL2lkLm9uZmlkby5jb20iLCJhdXRoX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJvbmZpZG9fYXBpX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJ0ZWxlcGhvbnlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSJ9fQ.MIGHAkF7MdF8zWMK0hEpodIPnQ1xqhRUq2npFbWt5FxiUiVS8rV-KchIOGuuj3pz68zqtZll2NgR5G02RMYcuPB02sEYwQJCAcvcDSggm42AIdmguGnEyM2n3yQmyBLFoD4m6iU4i8p6NOIIFRoF0eZbt88RSuJnyaZV8lTK47",//"${jsonResponse["token"]}",//"eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE3MTE1MjQ3NDYsInBheWxvYWQiOnsiYXBwIjoiYjdiOTNjYzUtNWU3ZC00ZWU0LWEyOGEtNWQ3MmI1NGY0Mjg4IiwiYXBwbGljYXRpb25faWQiOiJjb20uZXhhbXBsZS5vbmZpZG8iLCJjbGllbnRfdXVpZCI6Ijc2ODI0NmFjLWJmYjItNDcwZC1hYTIyLTFlOWZiMzIwMzU0NCIsImlzX3NhbmRib3giOnRydWUsImlzX3NlbGZfc2VydmljZV90cmlhbCI6dHJ1ZSwiaXNfdHJpYWwiOnRydWUsInNhcmRpbmVfc2Vzc2lvbiI6ImIwM2ZmNGUzLTQ3YTgtNDE1Yi1iZmFmLTA4MzMxZTUyMjIxZCJ9LCJ1dWlkIjoicGxhdGZvcm1fc3RhdGljX2FwaV90b2tlbl91dWlkIiwidXJscyI6eyJkZXRlY3RfZG9jdW1lbnRfdXJsIjoiaHR0cHM6Ly9zZGsub25maWRvLmNvbSIsInN5bmNfdXJsIjoiaHR0cHM6Ly9zeW5jLm9uZmlkby5jb20iLCJob3N0ZWRfc2RrX3VybCI6Imh0dHBzOi8vaWQub25maWRvLmNvbSIsImF1dGhfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsIm9uZmlkb19hcGlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsInRlbGVwaG9ueV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.MIGIAkIB1jwJDDzwZGiiPbRTyItqCLpsCNU88gxiYwIahbkD0NAzfuZH8-cIE5fXlTd62IhhUaJbH1LjnXNOYY6JyMHSffECQgDZz8klk7Q7ofpBkW8BMUzweH_3C2FFCE-eGoRdTsMxK1u7bpjA-54KqNLg3P42JbmuzruQwZSiRhhuFQtHT0i0MA",
      //     iosLocalizationFileName: "onfido_ios_localisation", //Optional
      //     onfidoTheme: OnfidoTheme.AUTOMATIC //Optional
      // )));



      return true;

    } else {

      return false;
    }
  }


 Future<void> startOnfido(String sdkToken) async {



   debugPrint("----------------------------function call--------------------------");

     Onfido onfido = Onfido(
        sdkToken: "$sdkToken",//"eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE3MTE1MjQ3NDYsInBheWxvYWQiOnsiYXBwIjoiYjdiOTNjYzUtNWU3ZC00ZWU0LWEyOGEtNWQ3MmI1NGY0Mjg4IiwiYXBwbGljYXRpb25faWQiOiJjb20uZXhhbXBsZS5vbmZpZG8iLCJjbGllbnRfdXVpZCI6Ijc2ODI0NmFjLWJmYjItNDcwZC1hYTIyLTFlOWZiMzIwMzU0NCIsImlzX3NhbmRib3giOnRydWUsImlzX3NlbGZfc2VydmljZV90cmlhbCI6dHJ1ZSwiaXNfdHJpYWwiOnRydWUsInNhcmRpbmVfc2Vzc2lvbiI6ImIwM2ZmNGUzLTQ3YTgtNDE1Yi1iZmFmLTA4MzMxZTUyMjIxZCJ9LCJ1dWlkIjoicGxhdGZvcm1fc3RhdGljX2FwaV90b2tlbl91dWlkIiwidXJscyI6eyJkZXRlY3RfZG9jdW1lbnRfdXJsIjoiaHR0cHM6Ly9zZGsub25maWRvLmNvbSIsInN5bmNfdXJsIjoiaHR0cHM6Ly9zeW5jLm9uZmlkby5jb20iLCJob3N0ZWRfc2RrX3VybCI6Imh0dHBzOi8vaWQub25maWRvLmNvbSIsImF1dGhfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsIm9uZmlkb19hcGlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsInRlbGVwaG9ueV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.MIGIAkIB1jwJDDzwZGiiPbRTyItqCLpsCNU88gxiYwIahbkD0NAzfuZH8-cIE5fXlTd62IhhUaJbH1LjnXNOYY6JyMHSffECQgDZz8klk7Q7ofpBkW8BMUzweH_3C2FFCE-eGoRdTsMxK1u7bpjA-54KqNLg3P42JbmuzruQwZSiRhhuFQtHT0i0MA",
        iosLocalizationFileName: "onfido_ios_localisation", //Optional
        onfidoTheme: OnfidoTheme.AUTOMATIC //Optional
    );






    try {
      var response = await onfido.start(
        flowSteps: FlowSteps(
          proofOfAddress: true,
          welcome: true,
          documentCapture: DocumentCapture(),
          faceCapture: FaceCapture.photo(
            withIntroScreen: true,
          ),
        ),
      );

      debugPrint(
          "-----------------------------------------------$response"
      );

      // OnfidoResult(
      //   document: DocumentResult(
      //     front: DocumentSideResult(id: "id"),
      //     typeSelected: "passport",
      //     countrySelected: null,
      //   ),
      //   face: FaceResult(
      //     id: "id",
      //     variant: FaceCaptureType.video,
      //   ),
      //   proofOfAddress: ProofOfAddressResult(
      //     id: "id",
      //     type: "bank_building_society_statement",
      //     issuingCountry: "BRA",
      //   ),
      // );




      //... handle response
    } catch (error) {

      debugPrint(
          "-----------------------------------------------$error"
      );


      // ... handle error
    }
  }




}