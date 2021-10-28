import 'package:flutter/material.dart';
import 'package:toiletfinder/views/addToilet/add_toilet_view.dart';
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
            child: AddToiletView(),
          ),
          onPanelClosed: () {
            _showPanelCloseAlert();
          },
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          child: FloatingActionButton(
            onPressed: () {
              _showPanel();
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

  void _showPanel() {
    // Add your onPressed code here!
    _panelController.open();
    setState(() {
      _isAddButtonVisible = false;
    });
  }

  void _hidePanel() {
    setState(() {
      _isAddButtonVisible = true;
    });
  }

  void _showPanelCloseAlert() {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        _hidePanel();
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("CANCEL"),
      onPressed: () {
        Navigator.of(context).pop();
        _showPanel();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Cancel Adding New Toilet"),
      content:
          const Text("Are you sure you want to cancel adding the new toilet ?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
