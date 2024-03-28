


// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onfido/document_varification_provider.dart';
import 'package:onfido_sdk/onfido_sdk.dart';

class Home extends StatelessWidget{



  // final Onfido onfido = Onfido(
  //     sdkToken: "eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE3MTE2MTAwNzYsInBheWxvYWQiOnsiYXBwIjoiNTMzZDNjZmQtZTY4OS00ZWI2LTgyZGMtYzFkODdmM2QyODQ1IiwiYXBwbGljYXRpb25faWQiOiJjb20ucHNsLnBfcGF5LnBfcGF5IiwiY2xpZW50X3V1aWQiOiI3NjgyNDZhYy1iZmIyLTQ3MGQtYWEyMi0xZTlmYjMyMDM1NDQiLCJpc19zYW5kYm94Ijp0cnVlLCJpc19zZWxmX3NlcnZpY2VfdHJpYWwiOnRydWUsImlzX3RyaWFsIjp0cnVlLCJzYXJkaW5lX3Nlc3Npb24iOiIwMmFiNjNlNS00YjJkLTRhMmQtODk4YS02ZjY4MWJjODY2NWQifSwidXVpZCI6InBsYXRmb3JtX3N0YXRpY19hcGlfdG9rZW5fdXVpZCIsInVybHMiOnsiZGV0ZWN0X2RvY3VtZW50X3VybCI6Imh0dHBzOi8vc2RrLm9uZmlkby5jb20iLCJzeW5jX3VybCI6Imh0dHBzOi8vc3luYy5vbmZpZG8uY29tIiwiaG9zdGVkX3Nka191cmwiOiJodHRwczovL2lkLm9uZmlkby5jb20iLCJhdXRoX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJvbmZpZG9fYXBpX3VybCI6Imh0dHBzOi8vYXBpLm9uZmlkby5jb20iLCJ0ZWxlcGhvbnlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSJ9fQ.MIGIAkIAnC6At55Mj8XMjvLtbgaYU5BTMJDk-IBapbH3PCOXOHX1YXIHKyfb6ZgdlAfBi-x0TukKl7pPF30LJASLzRU1SscCQgDIzxKXuflNOzFLvSFzJq6GasfDtzK5xU4vIkt8LDtdHR76TRQ5pvVN949iJ5tFhzKD",//"eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE3MTE1MjQ3NDYsInBheWxvYWQiOnsiYXBwIjoiYjdiOTNjYzUtNWU3ZC00ZWU0LWEyOGEtNWQ3MmI1NGY0Mjg4IiwiYXBwbGljYXRpb25faWQiOiJjb20uZXhhbXBsZS5vbmZpZG8iLCJjbGllbnRfdXVpZCI6Ijc2ODI0NmFjLWJmYjItNDcwZC1hYTIyLTFlOWZiMzIwMzU0NCIsImlzX3NhbmRib3giOnRydWUsImlzX3NlbGZfc2VydmljZV90cmlhbCI6dHJ1ZSwiaXNfdHJpYWwiOnRydWUsInNhcmRpbmVfc2Vzc2lvbiI6ImIwM2ZmNGUzLTQ3YTgtNDE1Yi1iZmFmLTA4MzMxZTUyMjIxZCJ9LCJ1dWlkIjoicGxhdGZvcm1fc3RhdGljX2FwaV90b2tlbl91dWlkIiwidXJscyI6eyJkZXRlY3RfZG9jdW1lbnRfdXJsIjoiaHR0cHM6Ly9zZGsub25maWRvLmNvbSIsInN5bmNfdXJsIjoiaHR0cHM6Ly9zeW5jLm9uZmlkby5jb20iLCJob3N0ZWRfc2RrX3VybCI6Imh0dHBzOi8vaWQub25maWRvLmNvbSIsImF1dGhfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsIm9uZmlkb19hcGlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsInRlbGVwaG9ueV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.MIGIAkIB1jwJDDzwZGiiPbRTyItqCLpsCNU88gxiYwIahbkD0NAzfuZH8-cIE5fXlTd62IhhUaJbH1LjnXNOYY6JyMHSffECQgDZz8klk7Q7ofpBkW8BMUzweH_3C2FFCE-eGoRdTsMxK1u7bpjA-54KqNLg3P42JbmuzruQwZSiRhhuFQtHT0i0MA",
  //     iosLocalizationFileName: "onfido_ios_localisation", //Optional
  //     onfidoTheme: OnfidoTheme.AUTOMATIC //Optional
  // );


   Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Center(
            child: ElevatedButton(onPressed: () {

              DocumentVarificationProvider().createOnfidoApplicant('Naf', 'im', '1990-03-01', "London", "1230");
              //startOnfido();
            }, child: Text("Make Click"),

            ),
          )

        ],
      ),
    );
  }


  // startOnfido() async {
  //   try {
  //     final response = await onfido.start(
  //       flowSteps: FlowSteps(
  //         proofOfAddress: true,
  //         welcome: true,
  //         documentCapture: DocumentCapture(),
  //         faceCapture: FaceCapture.photo(
  //           withIntroScreen: true,
  //         ),
  //       ),
  //     );
  //
  //     debugPrint(
  //         "-----------------------------------------------$response"
  //     );
  //
  //     // OnfidoResult(
  //     //   document: DocumentResult(
  //     //     front: DocumentSideResult(id: "id"),
  //     //     typeSelected: "passport",
  //     //     countrySelected: null,
  //     //   ),
  //     //   face: FaceResult(
  //     //     id: "id",
  //     //     variant: FaceCaptureType.video,
  //     //   ),
  //     //   proofOfAddress: ProofOfAddressResult(
  //     //     id: "id",
  //     //     type: "bank_building_society_statement",
  //     //     issuingCountry: "BRA",
  //     //   ),
  //     // );
  //
  //
  //
  //
  //   //... handle response
  //   } catch (error) {
  //
  //     debugPrint(
  //       "-----------------------------------------------$error"
  //     );
  //
  //
  //  // ... handle error
  //   }
  // }




}