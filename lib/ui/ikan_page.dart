import 'package:flutter/material.dart';
import 'package:ikan/model/fish.dart';
import 'package:ikan/ui/ikan_detail.dart';
import 'package:ikan/ui/ikan_form.dart';
import 'package:ikan/fish_bloc.dart';

class IkanPage extends StatefulWidget {
  const IkanPage({Key? key}) : super(key: key);

  @override
  _IkanPageState createState() => _IkanPageState();
}

class _IkanPageState extends State<IkanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Ikan'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IkanForm()));
                },
              ))
        ],
      ),
      body: FutureBuilder<List>(
        future: IkanBloc.getIkans(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListIkan(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListIkan extends StatelessWidget {
  final List? list;

  const ListIkan({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return JenisIkan(
            ikan: list![i],
          );
        });
  }
}

class JenisIkan extends StatelessWidget {
  final Ikan ikan;

  const JenisIkan({Key? key, required this.ikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IkanDetail(
                        ikan: ikan,
                      )));
        },
        child: Card(
          child: ListTile(
            title: Text(ikan.nama!),
            subtitle: Column(children: [
              Text(ikan.jenis!),
              Text(ikan.warna!),
              Text(ikan.habitat!)
            ]),
          ),
        ));
  }
}
