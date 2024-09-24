import 'dart:math';
import 'package:cred/widget/collapsed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../riverpod/base_state.dart';
import '../riverpod/data_provider.dart';
import '../widget/bottom_sheet1.dart';
import '../widget/bottom_sheet2.dart';
import '../widget/custom_button.dart';
import 'package:cred/model/model.dart';

import '../widget/emi_selectno.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> with TickerProviderStateMixin {
  bool isBottomSheetOpen = false;

  AnimationController? _controller;
  ScrollController? _scrollController;

  int? selectedIndex; // Track the selected container
  List<Color> containerColors = [];
  bool isSelected = false;
  bool isBottomSheet2Open = false;
  double creditAmount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    // Initiate data fetching
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dataNotifierProvider.notifier)
          .fetchItems('https://api.mocklets.com/p6764/test_mint');
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final NumberFormat _formatter = NumberFormat('#,##,###');

  double _getMonthlyRate(double amount) {
    return (amount * 0.0104);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dataNotifierProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF280038FF),
        body: Builder(
          builder: (context) {
            // Handle different states
            if (state.status == DataStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == DataStatus.error) {
              return Center(
                child: Text('Error: ${state.message ?? 'Unknown error'}'),
              );
            } else if (state.status == DataStatus.success && state.data != null) {
              return _getStack(context, state.data?.items?.first, state.data);
            } else {
              return Center(
                child: Text('Press button to fetch items'),
              );
            }
          },
        ),
        // bottomSheet: BottomSheetWidget(
        //   controller: _controller!,
        //   data: state.data?.items?[1],
        //   onButtonPressed: () {},
        // ),
      ),
    );
  }

  Stack _getStack(BuildContext context, Item? item, ApiResponse? response) {
    final bottomSheetState = ref.watch(bottomSheetStateProvider);
    return Stack(
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            // color: Colors.black38
            color: Colors.black38
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                    Icons.close,
                  color: Colors.white,
                ),
                Icon(
                    Icons.help,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        bottomSheetState
            ? CreditInfoWidget(
                key1: item?.closedState?.body?.key1,
                value1: _formatter.format(creditAmount),
                key2: null,
                value2: null)
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      item?.openState?.body?.title ?? 'Title',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item?.openState?.body?.subtitle ?? 'Subtitle',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.46,
            // Adjusted height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SleekCircularSlider(
                  min: item?.openState?.body?.card?.minRange?.toDouble() ?? 0.0,
                  max: item?.openState?.body?.card?.maxRange?.toDouble() ?? 0.0,
                  initialValue: 15000,
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      trackWidth: 15,
                      progressBarWidth: 15,
                      handlerSize: 10,
                    ),
                    infoProperties: InfoProperties(
                      modifier: (double value) {
                        return ''; // We will handle custom text inside the slider below
                      },
                    ),
                    startAngle: 270,
                    angleRange: 360,
                    size: 200,
                    customColors: CustomSliderColors(
                      trackColor: Colors.grey[300]!,
                      progressBarColors: [Colors.orange, Colors.deepOrange],
                      hideShadow: true,
                    ),
                  ),
                  onChange: (double value) {
                    setState(() {
                      creditAmount = value;
                    });
                  },
                  innerWidget: (double value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item?.openState?.body?.card?.header ?? '',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Credit amount with dotted underline
                        Text(
                          '₹ ${_formatter.format(creditAmount)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dotted,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Monthly interest rate
                        Text(
                          item?.openState?.body?.card?.description ?? '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  item?.openState?.body?.footer ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        // Bottom Button
        CustomButton(
          text: item?.ctaText ?? '',
          onPressed: () {
            showCustomBottomSheet(
                context, response?.items?[1], response); //<-------->
          },
        ),
      ],
    );
  }

  List<Color> generateContainerColors(List<Item>? items) {
    final List<Color> colorList = [
      Colors.indigo,
      Colors.brown,
      Colors.purple,
      Colors.red,
      Colors.pink,
    ];

    Random random = Random();
    return List.generate(
      items?.length ?? 0,
      (index) => colorList[random.nextInt(colorList.length)],
    );
  }

  void showCustomBottomSheet(
      BuildContext context, Item? data, ApiResponse? response) {
    ref.watch(bottomSheetStateProvider.notifier).openBottomSheet();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows customization of height
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 9, 40, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.8, // Max height is 50% of screen height
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  //BottomSheet 1
                  child: BottomSheetWidget(
                    data: data,
                    onButtonPressed: () {
                      // Handle button press action
                      showCustomBottomSheet2(context, response?.items?[2]);
                    },
                    onChangeAccount: () {
                      // Handle change account action
                      print("Change Account Pressed");
                    },
                    onPressedEmi: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      ref.watch(bottomSheetStateProvider.notifier).closeBottomSheet();
    });
  }

  // <<<<<<<<<<<<<<<<<-------------------------------------->>>>>>>>>>>>>

  // <-------Custom BottomSheet 2------->

  void showCustomBottomSheet2(BuildContext context, Item? data) {
    ref.watch(bottomSheetStateProvider2.notifier).openBottomSheet();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows customization of height
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 9, 40, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.6, // Max height is 50% of screen height
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  // BottomSheet 2
                  child: BottomSheetWidget2(
                    data: data,
                    onButtonPressed: () {
                      // Handle button press action
                      print("button 2 pressed");
                    },
                    onChangeAccount: () {
                      // Handle change account action
                      print("Change Account Pressed");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      ref.watch(bottomSheetStateProvider2.notifier).closeBottomSheet();
    });
  }
}
