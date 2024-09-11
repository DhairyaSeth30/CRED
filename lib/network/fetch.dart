import 'package:cred/network/api-service.dart';
import 'package:cred/screen/base_screen.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  late Future<Map<String, dynamic>> futureData;  // Future to hold the API data

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Call the fetchData() function here
    futureData = ApiService().fetchData(
      url: "https://api.mocklets.com/p6764/test_mint",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData,  // Pass the future data here
        builder: (context, snapshot) {
          // Display loading indicator while fetching data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Display error if any occurs
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Data fetched successfully
          else if (snapshot.hasData) {
            print('data loaded successfully');
            final data = snapshot.data!['items'] as List<dynamic>;
            return BaseScreen(data : data);
            // return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     final item = data[index];
            //     return ListTile(
            //       title: Text(item['open_state']['body']['title']),
            //       subtitle: Text(item['open_state']['body']['subtitle']),
            //     );
            //   },
            // );
          }
          // Default fallback
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
