// Import core Flutter and Dart packages.
import 'package:flutter/material.dart';

// Import local application pages and widgets.
import 'package:training_app/time_off.dart';
import 'package:training_app/warranty_swap.dart';
import 'package:training_app/web_view.dart';
import 'package:training_app/znet_home.dart';
import 'change_bat.dart';
import 'checkout.dart';
import 'wittdtjr.dart';
import 'test_bat.dart';
import 'replace_wiper_blades.dart';

// Define the main TrainingHomePage widget as a StatefulWidget.
class TrainingHomePage extends StatefulWidget {
  const TrainingHomePage({Key? key}) : super(key: key);

  @override
  _TrainingHomePageState createState() => _TrainingHomePageState();
}

// Define the corresponding State class for TrainingHomePage.
class _TrainingHomePageState extends State<TrainingHomePage> {
  // Define the data for the buttons to be displayed in the grid.
  final List<Map<String, dynamic>> buttonData = [
    {'icon': Icons.battery_std, 'text': 'Change a Battery'},
    {'icon': Icons.person, 'text': 'WITTDTJR'},
    {'icon': Icons.swap_horiz, 'text': 'Replace Wiper Blades'},
    {'icon': Icons.electric_bolt, 'text': 'Testing a Battery'},
    {'icon': Icons.swap_vert_circle, 'text': 'Warranty Swap'},
    {'icon': Icons.shopping_cart, 'text': 'Checkout'},
    {'icon': Icons.calendar_month, 'text': 'Time Off'},
    {'icon': Icons.sell, 'text': 'ZNET'},
    {'icon': Icons.web, 'text': 'Website'},
  ];

  @override
  Widget build(BuildContext context) {
    // Define the UI structure of the TrainingHomePage.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            // Header section.
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF27405),
              ),
              child: const Text(
                'Training App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            // Content section.
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Select an option below to get started:',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: _buildButtonGrid(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the grid of buttons.
  Widget _buildButtonGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: buttonData.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildGridItem(context, index);
      },
    );
  }

  // Helper method to build individual grid items.
  Widget _buildGridItem(BuildContext context, int index) {
    return Card(
      elevation: 2.0,
      color: const Color(0xFFF0F4FE),
      child: InkWell(
        onTap: () => _onButtonTap(context, index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Icon(
                buttonData[index]['icon'],
                size: 80,
                color: const Color(0xFFF2620F),
              ),
            ),
            Text(
              buttonData[index]['text'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                color: Color(0xFF2b2b2b),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handle button taps and navigate to the appropriate page.
  void _onButtonTap(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = DetailPage(buttonText: "Change a Battery");
        break;
      case 1:
        page = const WittdtjrPage();
        break;
      case 2:
        page = ChangeWiperBladePage(buttonText: 'Replace Wiper Blades');
        break;
      case 3:
        page = const BatteryTestingGuidePage();
        break;
      case 4:
        page = WarrantySwapPage(buttonText: 'Warranty Swap');
        break;
      case 5:
        page = CheckoutPage(buttonText: 'Checkout');
        break;
      case 6:
        page = TimeOffPage(buttonText: 'Time Off');
        break;
      case 7:
        page = ZnetHome();
        break;
      case 8:
        page = const WebViewPage(buttonText: 'Website');
        break;
      default:
        return; // Handle default or unknown case.
    }

    // Navigate to the selected page with a fade transition.
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    ));
  }
}
