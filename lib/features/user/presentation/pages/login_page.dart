import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("961");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;

  final TextEditingController _phoneController = TextEditingController();

  final String _phoneNumber = "";

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text("Verify your phone number",
                        style: TextStyle(
                            fontSize: 20,
                            color: tabColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "WhatsApp will send or receive SMS messages to verify your phone number. Standard message and data rates may apply.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: whiteColor, fontSize: 15),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 2),
                    title: _buildDialogItem(_selectedFilteredDialogCountry),
                    onTap: _openFilteredCountryPickerDialog,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.50,
                              color: tabColor,
                            ),
                          ),
                        ),
                        width: 80,
                        height: 42,
                        alignment: Alignment.center,
                        child: Text(_selectedFilteredDialogCountry.phoneCode,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(top: 1.5),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: tabColor, width: 1.5))),
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                hintText: "Phone Number",
                                border: InputBorder.none),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "otpPage");
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: tabColor),
                child: Center(
                    child: const Text("Next",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(primaryColor: tabColor),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: tabColor,
            searchInputDecoration: const InputDecoration(
              hintText: "Search",
            ),
            isSearchable: true,
            title: const Text("Select your phone code"),
            onValuePicked: (Country country) {
              setState(() {
                _selectedFilteredDialogCountry = country;
                _countryCode = country.phoneCode;
              });
            },
            itemBuilder: _buildDialogItem,
          ),
        );
      },
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: tabColor, width: 1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(
            " +${country.phoneCode}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Text(
            " ${country.name}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          const Spacer(),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
