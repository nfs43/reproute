import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rep_route/network/Apis.dart';
import 'package:rep_route/network/request/SearchDoctorsRequest.dart';
import 'package:rep_route/network/response/SearchDoctorsResponse.dart';
import 'package:rep_route/network/response/SpecialityResponse.dart';
import 'package:rep_route/network/response/ZipcodeResponse.dart';
import 'package:rep_route/utils/utils.dart';

class DashboardProvider extends ChangeNotifier {
  List<String>? _zipCodes = [];
  List<String>? _selectedzipCodes = [];
  List<String>? _specialities = [];
  List<String>? _selectedspecialities = [];

  late SearchDoctorsResponse _searchDoctorsResponse;
  List<String>? get zipCodes => _zipCodes;
  List<String>? get selectedzipCodes => _selectedzipCodes;

  List<String>? get specialities => _specialities;
  List<String>? get selectedspecialities => _selectedspecialities;

  // Setter for selectedzipCodes
  set selectedzipCodes(List<String>? value) {
    _selectedzipCodes = value;
    notifyListeners();
  }

  // Setter for selectedspecialities
  set selectedspecialities(List<String>? value) {
    _selectedspecialities = value;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      // Access the Apis instance
      Apis apis = Apis.init();

      // Call the methods to fetch zip codes and specialities
      ZipCodeResponse zipCodeResponse = await apis.getZipCodes();
      SpecialityResponse specialityResponse = await apis.getSpecialities();

      // Check for success before updating _specialities
      if (specialityResponse.status == true) {
        _specialities = specialityResponse.content;
        // Notify listeners about the changes
        notifyListeners();
      } else {
        // Handle the case where getting specialities failed
        print('Error fetching specialities: ${specialityResponse.status}');
      }

      // Check for success before updating _zipCodes
      if (zipCodeResponse.status == true) {
        _zipCodes = zipCodeResponse.content;
        // Notify listeners about the changes
        notifyListeners();
      } else {
        // Handle the case where getting zip codes failed
        print('Error fetching zip codes: ${zipCodeResponse.status}');
      }
    } catch (error) {
      // Handle errors and show error messages
      print('Error fetching data: $error');
    }
  }

  Future<void> SearchDoctors(
      BuildContext context, SearchDoctorsRequest searchDoctorsRequest) async {
    try {

      // Create an instance of Apis
      Apis apis = Apis.init();

      // Make the sign-up API call
       _searchDoctorsResponse =
          await apis.SearchDoctors(searchDoctorsRequest.toJson());

      // Handle success or perform any other logic
      if (_searchDoctorsResponse.status == true) {
            processAddresses(_searchDoctorsResponse);
      } else {
          showToast('no location found');
      }

      // Handle success or perform any other logic
    } catch (error) {
      // Handle errors and show error messages
    } finally {

    }
  }


  // New property to store the list of addresses
  List<Map<String, String>> _addresses = [];
  List<Map<String, String>> get addresses => _addresses;

Future<void> processAddresses(SearchDoctorsResponse searchDoctorsResponse) async {
  for (int i = 0; i < searchDoctorsResponse.content!.length; i++) {
    String address = searchDoctorsResponse.content![i].address ?? '';

    // Use geocoding to convert the address to coordinates
    List<Location> locations = await locationFromAddress(address);

    // Check if any locations were found
    if (locations.isNotEmpty) {
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;

      // Create a map with the parsed values
      _addresses.add({
        "firstname": searchDoctorsResponse.content![i].firstname??'',
        "lastname": searchDoctorsResponse.content![i].lastname??'',
        "speciaciality": searchDoctorsResponse.content![i].speciaciality??'',
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      });
    }
  }

  // Notify listeners after processing all addresses
  notifyListeners();
}
}
