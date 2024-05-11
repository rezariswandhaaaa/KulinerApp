import 'package:flutter/material.dart';
import 'package:kuliner_app/controller/kuliner_controller.dart';
import 'package:kuliner_app/model/kuliner.dart';
import 'package:kuliner_app/screen/detail_screen.dart';
import 'package:kuliner_app/widget/form_kuliner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final KulinerController _controller = KulinerController();

   @override
  void initState() {
    super.initState();
    _controller.getPlace();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Tempat Kuliner"),
      ),
      body: FutureBuilder<List<Kuliner>>(
        future: _controller.getPlace(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Kuliner place = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                    kuliner: Kuliner(
                                      id: place.id,
                                  nama: place.nama,
                                  alamat: place.alamat,
                                  nomor: place.nomor,
                                ))));
                  },
                
                child: Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromARGB(255, 153, 236, 202),
                  child: ListTile(
                    title: Text(
                      place.nama,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                         
                        const SizedBox(height: 4),
                        Text(
                          place.nomor,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                )
              );     
            },
          );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 153, 236, 202),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormKuliner()));
        },
        child: const Icon(Icons.add,),

      ),
    );
  }
}
