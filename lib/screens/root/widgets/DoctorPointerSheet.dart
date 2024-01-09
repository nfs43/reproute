import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/widgets/EditableChipField.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';

class DoctorPointerSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
              Row(
                children: [
                  Text(
                    'Doctor',
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
            Container(
      margin: const EdgeInsets.only( top: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/man-doc.jpg',
                        height: 80,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        'Dr.Courtney Henry',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          const TextSpan(
                            text: 'NPI: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const TextSpan(
                            text: '1245319599',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
              thickness: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text('Urgent Care', style: TextStyle(color: Colors.blue)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  const TextSpan(
                    text: 'Phone:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  const TextSpan(
                    text: '(480)555-0103',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  const TextSpan(
                    text: 'Address:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  const TextSpan(
                    text: '8300 W Chevenne Ave, Las Vegas',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  const TextSpan(
                    text: 'Official Email:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  const TextSpan(
                    text: 'example@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonbg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.grey.shade300, width: 1.0),
                      ),
                      elevation: 0.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                      child: Text(
                        'Schedule a Meeting',
                        style: seminormalText.copyWith(color: white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child:  SvgPicture.asset(
                    'assets/icons/map_pointer.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
  
            
             ],
        ),
      ),
    );
  }
}
