import 'package:flutter/material.dart';
import 'package:ikan/model/fish.dart';
import 'package:ikan/widget/warning_dialog.dart';
import 'package:ikan/ui/ikan_page.dart';
import 'package:ikan/fish_bloc.dart';

class IkanForm extends StatefulWidget {
  Ikan? ikan;
  IkanForm({Key? key, this.ikan}) : super(key: key);

  @override
  _IkanFormState createState() => _IkanFormState();
}

class _IkanFormState extends State<IkanForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH DATA";
  String tombolSubmit = "SIMPAN";

  final _namaIkanTextboxController = TextEditingController();
  final _jenisIkanTextboxController = TextEditingController();
  final _warnaIkanTextboxController = TextEditingController();
  final _habitatIkanTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.ikan != null) {
      setState(() {
        judul = "UBAH DATA";
        tombolSubmit = "UBAH";
        _namaIkanTextboxController.text = widget.ikan!.nama!;
        _jenisIkanTextboxController.text = widget.ikan!.jenis!;
        _warnaIkanTextboxController.text = widget.ikan!.warna!;
        _habitatIkanTextboxController.text = widget.ikan!.habitat!;
      });
    } else {
      judul = "TAMBAH DATA";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _namaIkanTextField(),
                _jenisIkanTextField(),
                _warnaIkanTextField(),
                _habitatIkanTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaIkanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Ikan"),
      keyboardType: TextInputType.text,
      controller: _namaIkanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama harus diisi";
        }
        return null;
      },
    );
  }

  Widget _jenisIkanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Jenis Ikan"),
      keyboardType: TextInputType.text,
      controller: _jenisIkanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Jenis harus diisi";
        }
        return null;
      },
    );
  }

  Widget _warnaIkanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Warna Ikan"),
      keyboardType: TextInputType.text,
      controller: _warnaIkanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Warna harus diisi";
        }
        return null;
      },
    );
  }

  Widget _habitatIkanTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Habitat Ikan"),
      keyboardType: TextInputType.text,
      controller: _habitatIkanTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Habitat harus diisi";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.ikan != null) {
                ubah();
              } else {
                simpan();
              }
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Ikan createData = Ikan(idIkan: null);
    createData.nama = _namaIkanTextboxController.text;
    createData.jenis = _jenisIkanTextboxController.text;
    createData.warna = _warnaIkanTextboxController.text;
    createData.habitat = _habitatIkanTextboxController.text;
    IkanBloc.addData(ikan: createData).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const IkanPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silakan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Ikan updateData = Ikan(idIkan: null);
    updateData.idIkan = widget.ikan!.idIkan;
    updateData.nama = _namaIkanTextboxController.text;
    updateData.jenis = _jenisIkanTextboxController.text;
    updateData.warna = _warnaIkanTextboxController.text;
    updateData.habitat = _habitatIkanTextboxController.text;
    IkanBloc.updateData(ikan: updateData).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const IkanPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
