import 'package:flutter/material.dart';
import 'package:toiletfinder/views/form/add_toilet_form.dart';
import 'package:toiletfinder/views/map/map_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Slider
  final double _panelHeightClosed = 0;

  bool _isAddButtonVisible = true;
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SlidingUpPanel(
          controller: _panelController,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          minHeight: _panelHeightClosed,
          parallaxEnabled: true,
          body: const MapView(),
          panel: const Center(
            child: AddToiletPage(),
          ),
          onPanelClosed: () { setState(() {
            _isAddButtonVisible = true;  
          });
          },
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),),
        ),
        floatingActionButton: AnimatedOpacity(
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              _panelController.open();
              setState(() {
                _isAddButtonVisible = false;
              });
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.yellow,
          ),
          duration: const Duration(milliseconds: 100),
          opacity: _isAddButtonVisible ? 1 : 0,
        ),
      ),
    );
  }
}
