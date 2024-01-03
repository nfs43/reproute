import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';

class DoctorsListing extends StatefulWidget {
  const DoctorsListing({Key? key}) : super(key: key);

  @override
  _DoctorsListingState createState() => _DoctorsListingState();
}

class _DoctorsListingState extends State<DoctorsListing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // showSearch(
              //     context: context,
              //     // delegate to customize the search bar
              //     delegate: CustomSearchDelegate());
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 0,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
              decoration: BoxDecoration(
                color: dashboardbg,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // method to show the search bar
                    },
                    icon: const Icon(Icons.search),
                  ),
                  Text('Search'),
                ],
              ),
            ),
          ),
          Expanded(child: CustomListView())
        ],
      ),
    );
  }
}


class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final List<ItemData> dummyData = [
    ItemData(
      doctorName: 'Dr.Courtney Henry',
      transId: 'N/A',
      phone: '(480)555-0103',
      address: '8300 W Cheyenne Ave, Las Vegas',
      email: 'example@gmail.com',
    ),
     ItemData(
      doctorName: 'Dr.Brent Galbert',
      transId: 'N/A',
      phone: '(480)555-0103',
      address: '8300 W Cheyenne Ave, Las Vegas',
      email: 'example@gmail.com',
    ),
     ItemData(
      doctorName: 'Dr.Courtney Henry',
      transId: 'N/A',
      phone: '(480)555-0103',
      address: '8300 W Cheyenne Ave, Las Vegas',
      email: 'example@gmail.com',
    ),
     ItemData(
      doctorName: 'Dr.Courtney Henry',
      transId: 'N/A',
      phone: '(480)555-0103',
      address: '8300 W Cheyenne Ave, Las Vegas',
      email: 'example@gmail.com',
    ),
     ItemData(
      doctorName: 'Dr.Courtney Henry',
      transId: 'N/A',
      phone: '(480)555-0103',
      address: '8300 W Cheyenne Ave, Las Vegas',
      email: 'example@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        return CustomItemLayout(itemData: dummyData[index]);
      },
    );
  }
}

class CustomItemLayout extends StatelessWidget {
  final ItemData itemData;

  const CustomItemLayout({required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/women-doc.jpg',
                        height: 80,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        itemData.doctorName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: 'NPI: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
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
            margin: EdgeInsets.only(top: 20),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
              thickness: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text('Urgent Care', style: TextStyle(color: Colors.blue)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Phone:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: itemData.phone,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Address:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: itemData.address,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Official Email:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: itemData.email,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                Expanded(
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
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                      child: Text(
                        'Schedule a Meeting',
                        style: seminormalText.copyWith(color: black),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
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
    );
  }
}

class ItemData {
  final String doctorName;
  final String transId;
  final String phone;
  final String address;
  final String email;

  ItemData({
    required this.doctorName,
    required this.transId,
    required this.phone,
    required this.address,
    required this.email,
  });
}





