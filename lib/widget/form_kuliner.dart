import 'package:flutter/material.dart';
import 'package:kuliner_app/model/kuliner.dart';
import 'package:kuliner_app/screen/home_screen.dart';
import 'package:kuliner_app/screen/map_screen.dart';

class FormKuliner extends StatefulWidget {
  const FormKuliner({super.key});

  @override
  State<FormKuliner> createState() => _FormKulinerState();
}

class _FormKulinerState extends State<FormKuliner> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _noteleponController = TextEditingController();

  String? _alamat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Kuliner"),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Nama Kuliner",
                      hintText: "Masukkan Nama Kuliner",
                    ),
                    controller: _namaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama kuliner tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Alamat"),
                      _alamat == null
                          ? const SizedBox(
                              width: double.infinity,
                              child: Text('Alamat kosong'))
                          : Text('$_alamat'),
                      _alamat == null
                          ? TextButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapScreen(
                                        onLocationSelected: (selectedAddress) {
                                      setState(() {
                                        _alamat = selectedAddress;
                                      });
                                    }),
                                  ),
                                );
                              },
                              child: const Text('Pilih Alamat'),
                            )
                          : TextButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapScreen(
                                        onLocationSelected: (selectedAddress) {
                                      setState(() {
                                        _alamat = selectedAddress;
                                      });
                                    }),
                                  ),
                                );
                                setState(() {});
                              },
                              child: const Text('Ubah Alamat'),
                            ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Nomor Telepon",
                        hintText: "Masukkan Nomor Telepon",
                      ),
                      controller: _noteleponController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Telepon tidak boleh kosong';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Nomor telepon harus berupa angka';
                        } else if (value.length < 10 || value.length > 12) {
                          return 'Nomor telepon harus memiliki panjang 10-12 digit';
                        }
                        return null;
                      }),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        }
                      },
                      child: const Text("Submit")),
                )
              ],
            ),
          )),
    );
  }
}
