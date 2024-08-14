import 'package:aula_app_2/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dificultyController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (valueValidator(value)) {
      if (int.parse(value!) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Tarefa',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um nome para a tarefa.';
                        }
                        return null;
                      },
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        hintText: 'Nome',
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Insira uma dificuldade entre 1 e 5.';
                        }
                        return null;
                      },
                      controller: _dificultyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        hintText: 'Dificuldade',
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(
                          () {},
                        );
                      },
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira uma url de imagem válida.';
                        }
                        return null;
                      },
                      controller: _imageController,
                      keyboardType: TextInputType.url,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        hintText: 'Imagem',
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    width: 72,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        _imageController.text,
                        errorBuilder: (BuildContext context, Object expection,
                            StackTrace? stack) {
                          return Image.asset('assets/images/noPhoto.webp');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.blue),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Contruindo as informações.'),
                          ),
                        );
                        TaskInherited.of(widget.taskContext).includeTask(
                            _nameController.text,
                            int.parse(_dificultyController.text),
                            _imageController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
