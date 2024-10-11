import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;
  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Detail Produk', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple[800]!,
              Colors.deepPurple[600]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kode : ${widget.produk!.kodeProduk}",
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              Text(
                "Nama : ${widget.produk!.namaProduk}",
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              Text(
                "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              _tombolHapusEdit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: const Text("EDIT", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk!,
                ),
              ),
            );
          },
        ),
        OutlinedButton(
          child: const Text("DELETE", style: TextStyle(color: Colors.white)),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?",
          style: TextStyle(color: Color.fromARGB(255, 80, 18, 138))),
      actions: [
        OutlinedButton(
          child: const Text("Ya",
              style: TextStyle(color: Color.fromARGB(255, 80, 18, 138))),
          onPressed: () {
            ProdukBloc.deleteProduk(id: (widget.produk!.id!)).then(
              (value) => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProdukPage(),
                )),
              },
              onError: (error) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                    description: "Hapus gagal, silahkan coba lagi",
                  ),
                );
              },
            );
          },
        ),
        OutlinedButton(
          child: const Text("Batal",
              style: TextStyle(color: Color.fromARGB(255, 80, 18, 138))),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
