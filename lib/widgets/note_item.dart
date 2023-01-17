import 'package:flutter/material.dart';

class Custom_notes_item extends StatelessWidget {
  const Custom_notes_item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.amber[200]),
      child: Column(
        children: [
          ListTile(
              title: Text(
                'Flutter tips',
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'add your note here please ziad mohammad alsafe',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.black,
                iconSize: 32,
                onPressed: () {},
              )),
          Padding(
            padding: const EdgeInsets.only(right: 24, top: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'mac 20,2023',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}