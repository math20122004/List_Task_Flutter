import 'package:aula_app_2/Components/difficulty.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nameText;
  final String filePhoto;
  final int dificuldade;
  int nivel = 0;

  Task(this.nameText, this.filePhoto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool asssetOrNetwork() {
    if (widget.filePhoto.contains('http')) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: asssetOrNetwork()
                            ? Image.network(
                                widget.filePhoto,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.filePhoto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nameText,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.blue),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.black,
                            ),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ])
          ],
        ));
  }
}
