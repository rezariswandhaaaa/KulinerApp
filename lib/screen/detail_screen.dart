import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kuliner_app/model/kuliner.dart';
import 'package:kuliner_app/screen/edit_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.kuliner});

  final Kuliner kuliner;

  @override
  State<DetailScreen> createState() => _DetailScreenState(kuliner);
}

class _DetailScreenState extends State<DetailScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nomor = TextEditingController();

  Kuliner kuliner;
  _DetailScreenState(this.kuliner);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tempat Kuliner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 12,
          color: const Color.fromARGB(255, 153, 236, 202),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    title: const Text("Tempat Kuliner"),
                    subtitle: Text(kuliner.nama)),
                ListTile(
                  title: const Text("Alamat Tempat Kuliner"),
                  subtitle: Text(kuliner.alamat),
                ),
                ListTile(
                  title: const Text("Nomor Telepon Tempat Kuliner"),
                  subtitle: Text(kuliner.nomor),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 153, 236, 202),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditScreen()));
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
