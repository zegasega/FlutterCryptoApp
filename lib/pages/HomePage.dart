import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CryptoData> cryptoDataList = [];
  List<CryptoData> filteredCryptoDataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=100&page=1'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        cryptoDataList = responseData
            .map((data) => CryptoData.fromJson(data))
            .toList();
        filteredCryptoDataList = cryptoDataList;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void filterCryptoData(String query) {
    setState(() {
      filteredCryptoDataList = cryptoDataList
          .where((crypto) =>
              crypto.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text('Crypto Prices'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CryptoSearchDelegate(filterCryptoData),
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: filteredCryptoDataList.length,
          itemBuilder: (context, index) {
            return CryptoCard(cryptoData: filteredCryptoDataList[index]);
          },
        ),
      ),
    );
  }
}

class CryptoData {
  final String name;
  final double price;
  final String iconUrl;
  final double priceChange;

  CryptoData(
      {required this.name,
      required this.price,
      required this.iconUrl,
      required this.priceChange});

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    return CryptoData(
      name: json['name'],
      price: json['current_price'].toDouble(),
      iconUrl: json['image'],
      priceChange: json['price_change_percentage_24h'].toDouble(),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final CryptoData cryptoData;

  CryptoCard({required this.cryptoData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          cryptoData.iconUrl,
          width: 45,
          height: 45,
        ),
        title: Text(
          cryptoData.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${cryptoData.price}',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              '%${cryptoData.priceChange}',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoSearchDelegate extends SearchDelegate<String> {
  final Function(String) filterFunction;

  CryptoSearchDelegate(this.filterFunction);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          filterFunction('');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
