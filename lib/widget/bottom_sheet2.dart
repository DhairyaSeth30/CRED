import 'package:flutter/material.dart';

import 'custom_button.dart';

class BottomSheet2 extends StatelessWidget {
  final List<dynamic> emiData; // Add a data field to accept data

  const BottomSheet2({super.key, required this.emiData}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Set height to 30% of the screen
      // height: 400,
      width: double.infinity,

      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),

          Text(
            emiData[2]['open_state']['body']['title'],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            emiData[2]['open_state']['body']['subtitle'],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 150,
            width: 150,
            color: Colors.blue,
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {},
            child: Text('Create your own plan'),
          ),
          SizedBox(height: 25,),
          CustomButton(
            text: emiData[2]['cta_text'],
            onPressed: () {
              // BottomSheetHelper2.showBottomSheet(context, emiData);
            },
          ),
        ],
      ),
    );
  }
}



class BottomSheetHelper2 {
  static void showSecondBottomSheet(BuildContext context, dynamic emiData) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // Allows the sheet to adjust dynamically

      builder: (context) => WillPopScope(
        onWillPop: () async => true, // Allows back button to close the sheet
        child: BottomSheet2(emiData : emiData), // Pass the data here
      ),
    );
  }
}