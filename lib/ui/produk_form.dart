import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  Produk? produk;

  ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk Diva";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "Ubah Produk Diva";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextboxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextboxController.text = widget.produk!.hargaProduk.toString();
      });
    } else {
      judul = "Tambah Produk Diva";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,  // Membuat teks tebal
            color: Colors.white,           // Warna teks putih
          ),
        ),
        backgroundColor: Colors.deepPurple, // Warna AppBar
        iconTheme: const IconThemeData(
          color: Colors.white, // Warna panah back menjadi putih
        ),
      ),
      body: Container(
        // Agar background mencakup seluruh layar
        height: MediaQuery.of(context).size.height, 
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.purpleAccent], // Gradasi ungu tua
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _kodeProdukTextField(),
                  _namaProdukTextField(),
                  _hargaProdukTextField(),
                  _buttonSubmit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Kode Produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Kode Produk",
        labelStyle: TextStyle(color: Colors.white), // Warna label teks putih
      ),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks input putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Nama Produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama Produk",
        labelStyle: TextStyle(color: Colors.white), // Warna label teks putih
      ),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks input putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Harga Produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Harga",
        labelStyle: TextStyle(color: Colors.white), // Warna label teks putih
      ),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks input putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white, // Warna background tombol putih
        side: const BorderSide(color: Colors.white), // Border putih
      ),
      child: Text(
        tombolSubmit,
        style: const TextStyle(
          color: Colors.deepPurple, // Warna teks tombol ungu
        ),
      ),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          // Lakukan proses simpan atau ubah produk
        }
      },
    );
  }
}
