import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';


class selectCSCpro extends StatefulWidget {
  @override
  _selectCSCproState createState() => _selectCSCproState();
}
class _selectCSCproState extends State<selectCSCpro> {
  TextEditingController country=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController city=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country->State->City'),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child:
          Column(
            children: [
              CountryStateCityPicker(
                  country: country,
                  dialogColor: const Color(0xfff3f3f3),
                  textFieldDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      prefixIcon: Icon(Icons.location_history),
                      border: OutlineInputBorder(borderSide: BorderSide.none)), state: state, city: city,
              ),
              const SizedBox(height: 20),
              Text("${country.text}\t${state.text}\t${city.text}")
            ],
          )
      ),
    );
  }
}