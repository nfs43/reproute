import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/network/request/SearchDoctorsRequest.dart';
import 'package:rep_route/providers/dashboardProvider.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/widgets/SpecialityChipField.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';
import 'package:rep_route/widgets/ZipCodeChipField.dart';

class FilterSheet extends StatefulWidget {
  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final List<String> _pizzaToppings = <String>[
    'Olives',
    'Tomato',
    'Cheese',
    'Pepperoni',
    'Bacon',
    'Onion',
    'Jalapeno',
    'Mushrooms',
    'Pineapple',
  ];

  final List<String> _pizzaToppings2 = <String>[
    'Olives',
    'Tomato',
    'Cheese',
    'Pepperoni',
    'Bacon',
    'Onion',
    'Jalapeno',
    'Mushrooms',
    'Pineapple',
  ];

  late DashboardProvider dashboardProvider;

  @override
  void initState() {
    super.initState();
    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    //dashboardProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'Filters',
                      style: mainHeading,
                    ),
                    const Spacer(), // This will space the items evenly
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20, top: 30),
                  child: Text('Speciality',
                      style: labelInput.copyWith(color: textBlack))),
              SpecialityChipField(
                dashboardProvider: dashboardProvider,
                initialValues: dashboardProvider.specialities ?? [],
                hintText: 'Enter speciality',
                toppingsList: dashboardProvider.specialities ?? [],
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    top: 30,
                  ),
                  child: Text('Zip Code',
                      style: labelInput.copyWith(color: textBlack))),
              ZipCodeChipField(
                dashboardProvider: dashboardProvider,
                initialValues: dashboardProvider.zipCodes ?? [],
                hintText: 'Enter zip code',
                toppingsList: dashboardProvider.zipCodes ?? [],
              ),
              SizedBox(
                height: 180,
              ),
              //const Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    ),
                    elevation: 0.0,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(
                      'Schedule a Meeting',
                      style: seminormalText.copyWith(color: black),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomPrimaryButton(
                  buttonColor: buttonbg,
                  textValue: 'Apply',
                  textColor: Colors.white,
                  onPressed: () {
                    if(dashboardProvider.selectedspecialities!.isEmpty||dashboardProvider.selectedspecialities!.isEmpty){
                      return;
                    }
                    dashboardProvider.SearchDoctors(
                        context,
                        SearchDoctorsRequest(
                            filterObj: FilterObj(
                                speciaciality:
                                    dashboardProvider.selectedspecialities!.isNotEmpty?dashboardProvider.selectedspecialities![0]:-1,
                                zipcode: dashboardProvider.selectedzipCodes!.isNotEmpty?dashboardProvider.selectedzipCodes![0]:-1)));
                                dashboardProvider.selectedspecialities=[];
                                dashboardProvider.selectedzipCodes=[];
                                Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
