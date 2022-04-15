// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names, deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutorsignin.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorupdateprofile.dart';


class tutorserviceseniorclass1 extends StatefulWidget {
  late String email;
  tutorserviceseniorclass1(this.email, {Key? key}) : super(key: key);

  // const tutorpersonaldetails2(String email, {Key? key}) : super(key: key);

  @override
  State<tutorserviceseniorclass1> createState() => _tutorserviceseniorclass1State();
}

class _tutorserviceseniorclass1State extends State<tutorserviceseniorclass1> {

  late String dropdownCity = 'ServiceType';
  var items =  ['ServiceType','Online Teacher','Private Home Teacher','Full Time Teacher','Part Term Teacher'];


  late String dropdownCitys = 'Location';
  var itemss =  ['Location','-------------------------','OGUN STATE','-------------------------','ABEOKUTA NORTH','ABEOKUTA SOUTH','ADO-ODO/OTA','EGBADO NORTH','EGBADO SOUTH','EWEKORO','IFO','IJEBU EAST','IJEBU NORTH','IJEBU ODE','IKENE','OMEKO AFON','IPOKIA',
    'OBAFEMI OWODE','ODEDA','ODOGBOLU','OGUN WATERSIDE','REMO NORTH','SHAGAMU','-------------------------','OSUN STATE','-------------------------','ATAKUNMOSA EAST','ATAKUNMOSA WEST','AIYEDAADE','AIYEDIRE','BOLUWADURO','BORIPE','EDE NORTH','EDE SOUTH','IFE CENTRAL','IFE EAST','IFE NORTH','IFE SOUTH','EGBEDORE',
    'EJIGBO','IFEDAYO','IFELODUN','ILA','ILESA EAST','ILESA WEST','IREPODUN','IREWOLE','ISOKAN','IWO','OBOKUN','ODO OTIN','OLA OLUWA','OLORUNDA','ORIADE','OROLU',
    'OSOGBO','-------------------------','OYO STATE','-------------------------','AFIJIO','AKINYELE','ATIBA','ATISBO','EGBEDA','IBADAN NORTH','IBADAN NORTH-EAST','IBADAN NORTH-WEST','IBADAN SOUTH-EAST','IBADAN SOUTH-WEST','IBARAPA EAST','IBARAPA CENTRAL','IBARAPA NORTH','IDO','IREPO','ISEYIN','ITESIWAJU','IWAJOWA','KAJOLA','LAGELU','OGBOMOSHO NORTH','OGBOMOSHO SOUTH','OGO OLUWA','OLORUNSOGO','OLUYOLE','ONA ARA','ORELOPE','ORI IRE','OYO','SAKA EAST','SAKA WEST','SURULERE','-------------------------','EKITI STATE','-------------------------','ADO EKITI','ARAMOKO','EFON-ALAAYE',
    'EMURE','GBONYIN','IDO OSI','IGEDE','IJERO-EKITI','IKERE','IKOLE','ISE','OYE','OMUO','-------------------------','ONDO STATE','-------------------------','AKOKO NORTH-EAST','AKOKO NORTH-WEST','AKOKO SOUTH-WEST','AKURE NORTH','ESE ODO','IDANRE','IFEDORE','ILAJE','ILE OLUJI/OKEIGBO','IRELE','ODIGBO','OKITIPUPA','ONDO EAST','ONDO WEST','OSE','OWO','-------------------------','KWARA STATE','-------------------------','ASA','BARUTEN','EDU','EKITI','IFELODUN','ILORIN EAST','ILORIN SOUTH','ILORIN WEST','IREPODUN','ISIN',
    'KAIAMA','MORO','OFFA','OKE','OYUN','PATEGI','-------------------------','EBONYI STATE','-------------------------','ABAKILIKI','AFIKPO SOUTH','EZZA NORTH','IKWO','ISHELU','IZZI','OHAOZRA','OHAUKWU','ONICHA','EBONYI','-------------------------','ENUGU STATE','-------------------------','ANINRI','ISI-UZO','NKANU EAST','ENUGU EAST','ENUGU NORTH','ENUGU SOUTH','EZEAGU','IGBO-ETITI','UMU-ITODO','AGWU','UDI MENT','OJI RIVER','NNSUKKA','-------------------------','ANAMBRA STATE','-------------------------','AGUATA','ANAMBRA EAST','ANAMBRA WEST','ANAOCHA','AWKA NORTH','AWKA SOUTH','AYAMELUM',
    'DUNUKOFIA','EKWUSIGO','IDEMILI NORTH','IDEMILI SOUTH','IHIALA','NJIKOKA','NNEWI NORTH','NNEWI SOUTH','OGBARU','ONITSHA NORTH','ONITSHA SOUTH','ORUMBA NORTH','ORUMBA SOUTH','OYI','-------------------------','ABIA STATE','-------------------------','ABA NORTH','ABA SOUTH','AROCHUKWU','BENDE','IKWUANO','ISIALA NGWA NORTH','ISIALA NGWA SOUTH','ISUIKWUATO','OBI NGWA','OHAFIA','OSISIOMA','UGWUNAGBO','UKWA EAST','UKWA WEST','UMUAHIA NORTH','UMUAHIA SOUTH','UMU NNEOCHI','-------------------------','IMO STATE','-------------------------','ABOH MBAISE','AHIAZU MBAISE','EHIME MBANO','EZINIHITTE','IDEATO NORTH',
    'IDEATO SOUTH','IHETTE/UBOMA','IKEDURU','ISIALA MBANO','ISU','MBAITOLI','NGOR OKPALA','NJABA','NKWERRE','NWANGELE','OBOWO','OGUTA','OHAJI/EGBEMA','OKIGWE','ORLU','ORSU','ORU EAST','ORU WEST','OWERRI MUNICIPAL','OWERRI NORTH','OWERRI WEST','ONUIMO','-------------------------','BAYELSA STATE','-------------------------','BRASS','EKEREMOR','KOLOKUMA/OPOKUMA','NEMBE','OGBIA','SAGBAMA','SOUTHERN IJAW','YENAGOA','-------------------------','DELTA STATE','-------------------------','ANIOCHA NORTH','ANIOCHA SOUTH','BOMADI','BURUTU','ETHIOPE EAST','ETHIOPE WEST',
    'IKA NORTH EAST','ISOKO NORTH','NDOKWA WEST','OKPE','OSHIMILI','PATANI','SAPELE','UDU','UGHELLI NORTH','UGHELLI SOUTH','UKWUANI','UVWIE','WARRI NORTH','WARRI SOUTH','AGBOR','ASABA','-------------------------','AKWA IBOM STATE','-------------------------','EASTERN OBOLO','ESIT EKET','ESSIEN UDIM','ABAK','EKET','ETIM EKPO','IBESIKPO ASUTAN','ETINAN','IBIONO','IKA','IKOT EKPENE','IKOT ABASI','ITU','INI/IKONO','MBO','NSIT ATAI','NSIT UBIUM/NSIT IBOM','OBOT AKARA','OKOBO','ONNA',
    'ORON','ORUK ANAM','UDUNG UKO','UKANAFAN','UQUO IBENO','URUAN','URUE EFFIONG','UYO','-------------------------','RIVER STATE','-------------------------','ABUA/ODIAL','AHOADA/AHOADA WEST','AKURU TORU','ANDONI','ASARI TORU','BONNY','DEGEMA','ELEME','EMOHUA','ETCHE','GOKANA','IKWERE','KHANA','OBIO/AKPOR','OGBA/EGBEMA/NDONI','OGU/BOLO','OKIRIKA','OMUMA','OPOBO/NKOROR','OYIBGO','PORT-HARCOURT','TAI'];

  TextEditingController email = TextEditingController();
  TextEditingController dropdownValue = TextEditingController();
  TextEditingController date = TextEditingController();


  @override
  void initState() {
    email = TextEditingController(text: "${widget.email}");
    super.initState();
  }

  Future editProfile1(BuildContext cont) async {
    if (dropdownCity == "" ||
        dropdownCitys == "" ||
        date.text == "" ||
        email.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }  else {

      var Url = 'http://192.168.43.29/dicetutormobile/addService2.php';
      var response = await http.post(Uri.parse(Url), body: {
        "email": email.text,
        "city": dropdownCity,
        "serviceoption": dropdownCitys,
        "dates": date.text,

      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorupdateprofile()));
      } else {}

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            // icon: Icon(Icons.home),
            icon: Icon(
              Icons.home,
              color: Colors.purple,
              size: 25.0,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color: Colors.yellow,
              size: 25.0,
            ),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.yellowAccent,
                size: 25.0,
              ),
              title: Text('Profile')
          )
        ],
      ),
      appBar: AppBar(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [

          Container(
            width: 1000,
            height: 32,
            color: Colors.white,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 25.0, vertical: 5.0),
              child: Text(
                "Add Service[Senior-Class]",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 2,
            color: Colors.white,
          ),
          //--------------------------------------------
          Container(
            color: Colors.white,
            height:20,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Visibility(
              visible: false,
              child: TextFormField(
                style: const TextStyle(
                  height:2,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email-Address",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          //--------------------------------------------
          Container(
            color: Colors.white,
            height:85,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Visibility(
              visible: true,
              child: TextFormField(
                style: const TextStyle(
                  height:3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                controller: date,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Date:(Year-Month-Day )",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height:82,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:75,
                    padding: EdgeInsets.symmetric(
                        horizontal: 44.0, vertical: 3),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.0),
                      borderRadius: BorderRadius.circular(9.0),
                    ),

                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),

                      isExpanded: true,
                      items: items.map((itemsnameG){
                        return DropdownMenuItem(
                            value: itemsnameG,
                            child: Text(itemsnameG)
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(() => dropdownCity = newValue as String),
                      value: dropdownCity,
                    ),

                  )

                ],
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            height:79,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:75,
                    padding: EdgeInsets.symmetric(
                        horizontal: 44.0, vertical: 3),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.0),
                      borderRadius: BorderRadius.circular(9.0),
                    ),

                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),

                      isExpanded: true,
                      items: itemss.map((itemsnamec){
                        return DropdownMenuItem(
                            value: itemsnamec,
                            child: Text(itemsnamec)
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(() => dropdownCitys = newValue as String),
                      value: dropdownCitys,
                    ),

                  )

                ],
              ),
            ),
          ),

          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 15,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 61,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  editProfile1(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorupdateprofile()));
                },
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 2.0, color: Colors.blue),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.values.last,
                      children: const <Widget>[
                        Text('Next',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
