import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTop;
  final void Function()? onDeleteTop;

  const NoteSettings({super.key, required this.onEditTop, required this.onDeleteTop,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit option
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTop!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: 
              Text(
                "Düzenle",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
            )),
          ), 
        ),
        //delete option
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTop!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: 
              Text(
                "Sil",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
            )),
          ), 
        ),
      ],
    );
  }
}