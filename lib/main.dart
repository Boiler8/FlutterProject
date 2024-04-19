import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinyl Style',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: VinylStylePage(),
    );
  }
}

class VinylStylePage extends StatefulWidget {
  @override
  _VinylStylePageState createState() => _VinylStylePageState();
}

class _VinylStylePageState extends State<VinylStylePage> {
  late String stoicQuote = '';
  late String stoicAuthor = '';
  late List<dynamic> songs = [];

  @override
  void initState() {
    super.initState();
    fetchStoicQuote();
    fetchSongs();
  }

  void fetchStoicQuote() async {
    try {
      final response = await http.get(Uri.parse('https://stoic.tekloon.net/stoic-quote'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          stoicQuote = data['quote'];
          stoicAuthor = data['author'];
        });
      } else {
        throw Exception('Failed to load stoic quote');
      }
    } catch (error) {
      print('Error fetching stoic quote: $error');
    }
  }

  void fetchSongs() async {
    try {
      final response = await http.get(Uri.parse('https://fluttertestproject-245c8.web.app'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          songs = data['songs'];
        });
      } else {
        throw Exception('Failed to load songs');
      }
    } catch (error) {
      print('Error fetching songs: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade700, Colors.purple.shade900],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
  child: SizedBox(
    height: 200,
    width: 800,
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5, 
            blurRadius: 7, 
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nujabes',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'battlecry',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'samurai champloo music record departure',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  ),
),
            Container(
              width: 300,
              color: Colors.grey.shade700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SideBarButton(title: 'aruarian dance'),
                  SideBarButton(title: 'luv(sic) pt3'),
                  SideBarButton(title: 'Eclipse'),
                  SideBarButton(title: 'battlecry'),
                  SideBarButton(title: 'Feather'),
                  SideBarButton(title: 'Reset Player'),
                  Text(
                    stoicQuote,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- $stoicAuthor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Vinyl Style',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'cursive',
              ),
            ),
            backgroundColor: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}

class SideBarButton extends StatelessWidget {
  final String title;

  const SideBarButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: EdgeInsets.all(16.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
