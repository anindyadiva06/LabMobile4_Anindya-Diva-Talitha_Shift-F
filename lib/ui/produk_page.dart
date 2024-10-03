import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Produk Diva',
          style: TextStyle(
            fontWeight: FontWeight.bold,  
            color: Colors.white,           
          ),
        ),
        backgroundColor: Colors.deepPurple, 
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0, color: Colors.white), 
              onTap: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProdukForm()));
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {},
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.purpleAccent], 
          ),
        ),
        child: ListView(
          children: [
            ItemProduk(
              produk: Produk(
                id: 1,
                kodeProduk: 'A001',
                namaProduk: 'Kamera',
                hargaProduk: 5000000,
              ),
            ),
            ItemProduk(
              produk: Produk(
                id: 2,
                kodeProduk: 'A002',
                namaProduk: 'Kulkas',
                hargaProduk: 2500000,
              ),
            ),
            ItemProduk(
              produk: Produk(
                id: 3,
                kodeProduk: 'A003',
                namaProduk: 'Mesin Cuci',
                hargaProduk: 2000000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              produk: produk,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(
            produk.namaProduk!,
            style: const TextStyle(color: Colors.deepPurple), 
          ),
          subtitle: Text(
            'Rp. ${produk.hargaProduk}',
            style: const TextStyle(color: Colors.deepPurple), 
          ),
        ),
      ),
    );
  }
}
