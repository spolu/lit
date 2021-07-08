import 'package:flutter/material.dart';

import 'model.dart';

class EntryEdit extends StatefulWidget {
  EntryEdit({
    required this.entry,
    required this.onUpdate,
  }) : super(key: ObjectKey(entry.id));

  final Entry entry;
  final Function(Entry) onUpdate;

  @override
  _EntryEditState createState() => _EntryEditState();
}

class _EntryEditState extends State<EntryEdit> {
  final _title_controller = TextEditingController();
  final _meta_controller = TextEditingController();
  final _body_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title_controller.text = widget.entry.title;
    _meta_controller.text = widget.entry.meta;
    _body_controller.text = widget.entry.body;
  }

  @override
  void dispose() {
    _title_controller.dispose();
    _meta_controller.dispose();
    _body_controller.dispose();
    this.widget.onUpdate(Entry(
        id: this.widget.entry.id,
        title: _title_controller.text,
        meta: _meta_controller.text,
        body: _body_controller.text));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 2,
        insetAnimationDuration: Duration(milliseconds: 0),
        insetAnimationCurve: Curves.linear,
        insetPadding: EdgeInsets.all(50.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Container(
          width: 800,
          height: 640,
          child: Column(
            children: <Widget>[
              Container(
                  child: Row(children: [
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  size: 13.0,
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    controller: _title_controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 7.0),
                    ),
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                )
              ])),
              Container(
                  child: Row(children: [
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.settings,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  size: 13.0,
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    controller: _meta_controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 7.0),
                    ),
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                )
              ])),
              Expanded(
                child: Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.article,
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          size: 13.0,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _body_controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 8,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  top: 3.5,
                                  bottom: 10.0,
                                  left: 7.0,
                                  right: 7.0),
                            ),
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black87),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
