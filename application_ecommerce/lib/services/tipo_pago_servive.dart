//import 'package:application_ecommerce/models/api_response.dart';
import 'package:application_ecommerce/models/tipoPagomodel.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:mysql1/mysql1.dart';

class tipopagoservice extends StatefulWidget {
  const tipopagoservice({Key? key}) : super(key: key);

  @override
  _tipopagoservice createState() => _tipopagoservice();
}

class _tipopagoservice extends State<tipopagoservice> {
  List categoryItemlist = [];

  Future getAllCategory() async {
    var baseUrl = "http://192.168.0.11/api/tipopago";

    http.Response response = await http.get(Uri.parse(baseUrl));

    // if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    setState(() {
      categoryItemlist = jsonData;
    });
    // }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var dropdownvalue;
  var dropdownvalueSubject;
  var subjectItemlist = [];

  Future getSubjects(getClassCode) async {
    var baseUrlSubject = "http://192.168.0.11:8000/api/tipopago";
    http.Response responseSubject = await http.get(Uri.parse(baseUrlSubject));
    if (responseSubject.statusCode == 200) {
      var jsonDataSubject = json.decode(responseSubject.body);
      setState(() {
        subjectItemlist.add(jsonDataSubject);
        print(subjectItemlist);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: Text('Select Class'),
              items: categoryItemlist.map((item) {
                return DropdownMenuItem(
                  value: item['ClassCode'].toString(),
                  child: Text(item['ClassName'].toString()),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  dropdownvalue = newVal;
                  getSubjects(dropdownvalue);
                });
              },
              value: dropdownvalue,
            ),
            DropdownButton(
              hint: Text('Selected Class Code Here'),
              items: subjectItemlist.map((item) {
                return DropdownMenuItem(
                  value: item['ClassCode'].toString(),
                  child: Text(item['ClassName'].toString()),
                );
              }).toList(),
              onChanged: (newValSubject) {
                setState(() {
                  dropdownvalueSubject = newValSubject;
                });
              },
              value: dropdownvalueSubject,
            ),
          ],
        ),
      ),
    );
  }
}
