import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/widgets/EditableChipField.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';

class FilterSheet extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
            EditableChipField(
              initialValues: _pizzaToppings,
              hintText: 'Enter speciality',
              toppingsList: _pizzaToppings,
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  bottom: 20,
                  top: 30,
                ),
                child: Text('Zip Code',
                    style: labelInput.copyWith(color: textBlack))),
            EditableChipField(
              initialValues: _pizzaToppings2,
              hintText: 'Enter zip code',
              toppingsList: _pizzaToppings2,
            ),
            const Spacer(),
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
                  // Navigator.pushReplacementNamed(
                  //     context, RoutesName.rootScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
