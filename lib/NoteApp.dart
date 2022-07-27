import 'package:flutter/material.dart';

class NoteApp extends StatefulWidget {
  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  // const NoteApp({Key? key}) : super(key: key);
  List<String> notes = ["Note App"];
  TextEditingController txtNoteContrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
      ),
      body: Column(
        children: [
         /* Row(
            children: [
              Expanded(
                child: TextField(
                  controller: txtNoteContrl,
                  decoration: InputDecoration(label: Text("Enter Note")),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    addNote();
                  },
                  child: Text("Add"))
            ],
          ),*/
          ListView.builder(
              itemCount: notes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                tileColor: Colors.grey,
                    title: Text(notes[index]),
                    trailing: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                print("Edit");
                                showAlertDialog(context, index);
                              },
                              child: Icon(Icons.edit)),
                          GestureDetector(
                              onTap: () {
                                print("delete");
                                removeNote(index);
                              },
                              child: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }

  addNote() {
    Navigator.of(context).pop();
    notes.add(txtNoteContrl.text);
    setState(() {});

  }

  removeNote(index) {
    notes.removeAt(index);
    setState(() {});
  }

  updateNote(index) {
    Navigator.of(context).pop();
    notes[index] = txtNoteContrl.text;
    setState(() {});
  }

  showAlertDialog(BuildContext context,index) {

    // set up the button
    Widget addBtn = TextButton(
      child: Text("Add"),
      onPressed: () {
        addNote();
      },
    );


    Widget updateBtn = TextButton(
      child: Text("Update"),
      onPressed: () {

        updateNote(index);
      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: TextField(
        controller: txtNoteContrl,
        decoration: InputDecoration(label: Text("Enter Note")),
      ),
      // content: Text(""),
      actions: [
        addBtn,
        updateBtn
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
