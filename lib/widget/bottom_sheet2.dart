// // <-----------Bottom Sheet 2------------->
//
// void _showBottomSheet2() {
//   setState(() {
//     isBottomSheet2Open = true;
//   });
//
//   _controller2!.forward(); // Start animation for BottomSheet 2
//
//   showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Stack(
//           children: [
//             AnimatedBuilder(
//               animation: _controller2!,
//               builder: (context, child) {
//                 print('Bottom sheet 2 is $isBottomSheet2Open');
//                 return Positioned(
//                   top: isBottomSheet2Open ? 80 : 50,
//                   left: 20,
//                   right: 20,
//                   child: Text(
//                     isBottomSheet2Open ? "Working" : "Not Working",
//                     style: TextStyle(
//                       fontSize: 20 + _textAnimation!.value * 20,
//                       // Adjust the range as needed
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               },
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height *
//                   0.6, // Set height to 30% of the screen
//               // height: 400,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(height: 5.0),
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.data[2]['open_state']['body']['title'],
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 5.0,
//                         ),
//                         Text(
//                           widget.data[2]['open_state']['body']['subtitle'],
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 // Leading part (Icon)
//                                 Icon(Icons.food_bank,
//                                     size: 40, color: Colors.blue),
//                                 SizedBox(width: 10),
//                                 // Middle part (Title and Subtitle)
//                                 Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       widget.data[2]['open_state']['body']
//                                       ['items'][0]['title'],
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Text(
//                                       widget.data[2]['open_state']['body']
//                                       ['items'][0]['subtitle']
//                                           .toString(),
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             // Trailing part (Circular checkbox for selection)
//                             Checkbox(
//                               shape: CircleBorder(), // To make it circular
//                               value: isSelected,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   isSelected = value ?? false;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Change account'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Expanded(
//                     child: CustomButton(
//                       text: widget.data[2]['cta_text'],
//                       onPressed: () {
//                         // BottomSheetHelper2.showBottomSheet(context, emiData);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }).whenComplete(() {
//     setState(() {
//       isBottomSheet2Open = false;
//     });
//     _controller2!
//         .reverse(); // Reverse the animation when BottomSheet 2 closes
//   });
// }

//
// // <----------Bottom Sheet 1-------------->
//
// void _showBottomSheet() {
//   String key1 = widget.data[1]['closed_state']['body']['key1'];
//   String key2 = widget.data[1]['closed_state']['body']['key2'];
//   String title = widget.data[1]['open_state']['body']['title'];
//   String subtitle = widget.data[1]['open_state']['body']['subtitle'];
//
//   setState(() {
//     isBottomSheetOpen = true;
//   });
//
//   _controller!.forward();
//
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     isDismissible: true,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setBottomSheetState) {
//           return Stack(
//             children: [
//               AnimatedBuilder(
//                 animation: _controller!,
//                 builder: (context, child) {
//                   print('YBottomSheet 2 is $isBottomSheet2Open');
//                   return Positioned(
//                     top: isBottomSheet2Open ? 170 : 170,
//                     left: 20,
//                     right: 20,
//                     child: isBottomSheet2Open
//                         ? Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Abcdvjkef fklaf djafl',
//                               style: const TextStyle(
//                                 color: Colors.blueGrey,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               'dfajf dksfjf ll falljfeifakl',
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                         : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: const TextStyle(
//                             color: Colors.blueGrey,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           subtitle,
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               DraggableScrollableSheet(
//                 initialChildSize: 0.7, // Start at 70% of screen height
//                 minChildSize: 0.3, // Minimum height is 30% of screen height
//                 maxChildSize: 0.9, // Maximum height is 90% of screen height
//                 builder: (context, scrollController) {
//                   return Container(
//                     decoration: const BoxDecoration(
//                       color: Color.fromRGBO(28, 17, 47, 5),
//                       borderRadius:
//                       BorderRadius.vertical(top: Radius.circular(25.0)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 10.0),
//                         // Padding(
//                         //   padding: const EdgeInsets.all(30.0),
//                         //   child: Column(
//                         //     crossAxisAlignment: CrossAxisAlignment.start,
//                         //     children: [
//                         //       Text(
//                         //         title,
//                         //         style: const TextStyle(
//                         //           color: Colors.blueGrey,
//                         //           fontSize: 25,
//                         //           fontWeight: FontWeight.w500,
//                         //         ),
//                         //       ),
//                         //       const SizedBox(height: 5),
//                         //       Text(
//                         //         subtitle,
//                         //         style: const TextStyle(
//                         //           color: Colors.grey,
//                         //           fontSize: 15,
//                         //           fontWeight: FontWeight.w400,
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         const SizedBox(height: 10),
//
//                         // Display Containers in a Row with selection check
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20.0),
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: List.generate(
//                                 widget.data[1]['open_state']['body']['items']
//                                     .length,
//                                     (index) {
//                                   var item = widget.data[1]['open_state']
//                                   ['body']['items'][index];
//
//                                   return GestureDetector(
//                                     onTap: () {
//                                       emi = widget.data[1]['open_state']
//                                       ['body']['items'][index]['emi'];
//                                       print(emi);
//                                       setBottomSheetState(() {
//                                         selectedIndex =
//                                             index; // Update within bottom sheet
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.all(10),
//                                       width: 200,
//                                       height: 200,
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(20.0)),
//                                         color: containerColors[
//                                         index], // Use pre-generated color
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Column(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 item['emi'] ?? 'No EMI',
//                                                 style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20,
//                                                 ),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                               Text(
//                                                 ' for ' + item['duration'] ??
//                                                     'No EMI',
//                                                 style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20,
//                                                 ),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                               const SizedBox(height: 15),
//                                               Text(
//                                                 item['subtitle'] ?? 'No EMI',
//                                                 style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15,
//                                                 ),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             ],
//                                           ),
//                                           if (selectedIndex ==
//                                               index) // Show check mark if selected
//                                             const Positioned(
//                                               top: 10,
//                                               left: 10,
//                                               child: Icon(
//                                                 Icons.check_circle,
//                                                 color: Colors.white,
//                                                 size: 30,
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30.0),
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ButtonStyle(
//                               backgroundColor:
//                               MaterialStateProperty.all<Color>(
//                                   Colors.transparent),
//                               side: MaterialStateProperty.all<BorderSide>(
//                                 const BorderSide(
//                                   color: Colors.blueGrey, // Border color
//                                   width: 2.0, // Border width
//                                 ),
//                               ),
//                             ),
//                             child: const Text(
//                               'Change account',
//                               style: TextStyle(color: Colors.blueGrey),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: CustomButton(
//                               text: widget.data[1]['cta_text'],
//                               onPressed: () {
//                                 _showBottomSheet2();
//                               }),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     },
//   ).whenComplete(() {
//     setState(() {
//       isBottomSheetOpen = false;
//     });
//     _controller!.reverse(); // Reverse the animation when bottom sheet closes
//   });
// }

import 'package:cred/model/model.dart';
import 'package:cred/widget/emi_selectno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'collapsed_widget.dart';
import 'custom_button.dart';

// Create a provider for managing bottom sheet state
final bottomSheetStateProvider2  =
    StateNotifierProvider<BottomSheetStateNotifier2, bool>((ref) {
  return BottomSheetStateNotifier2();
});

class BottomSheetStateNotifier2 extends StateNotifier<bool> {
  BottomSheetStateNotifier2() : super(false);

  void openBottomSheet() {
    state = true;
  }

  void closeBottomSheet() {
    state = false;
  }
}

class BottomSheetWidget2 extends ConsumerStatefulWidget {
  final Item? data; // Data to be passed in
  final Function() onButtonPressed; // Callback for the custom button
  final Function()? onChangeAccount; // Callback for the "Change account" button

  const BottomSheetWidget2({
    super.key,
    required this.data,
    required this.onButtonPressed,
    this.onChangeAccount,
  });

  @override
  _BottomSheetWidget2State createState() => _BottomSheetWidget2State();
}

class _BottomSheetWidget2State extends ConsumerState<BottomSheetWidget2> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Title and Subtitle
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data?.openState?.body?.title ?? 'Title',
                // 'Hello',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                widget.data?.openState?.body?.subtitle ?? 'Subtitle',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Leading part (Icon)
                      Icon(Icons.home, size: 40, color: Colors.blue),
                      SizedBox(width: 10),
                      // Middle part (Title and Subtitle)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // widget.data[2]['open_state']['body']['items'][0]['title'],
                            widget.data?.openState?.body?.items?.first.title ??
                                'Title',
                            // 'hello Dhairya',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.data?.openState?.body?.items?.first.subtitle
                                    .toString() ??
                                'Subtitle',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Trailing part (Circular checkbox for selection)
                  Checkbox(
                    shape: CircleBorder(), // To make it circular
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(widget.data?.openState?.body?.footer ?? ''),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: CustomButton(
            onPressed: widget.onButtonPressed,
            // text: widget.data?.ctaText?? '',
            text: widget.data?.ctaText ?? '',
          ),
        ),
      ],
    );
  }
}
