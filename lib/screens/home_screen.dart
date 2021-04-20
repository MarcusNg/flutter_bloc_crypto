import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Coins'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[900]!,
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${++index}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Bitcoin',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'BTC',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                '\$50000.0000',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
