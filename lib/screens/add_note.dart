import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  GlobalKey<FormState> _key=GlobalKey();
  var items = ['High','Low'];
  String dropdownValue='Low';
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    TextInputType textInputType = TextInputType.multiline;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Edit Note'),
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView(
            children: [
              ListTile(
                title: DropdownButton(
                  value: dropdownValue,
                  style: textStyle,
                  onChanged: (String? valueSelectedByUser){
                    setState(() {
                      dropdownValue=valueSelectedByUser!;
                    });
                  },
                  // items: items.map(
                  //   (String dropDownItems) {
                  //     return DropdownMenuItem<String>(
                  //         value: dropDownItems,
                  //        child: Text(dropDownItems),
                  //     );
                  //
                  //   },
                  // ).toList(),
                  items: <String>['Low', 'High',]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: size.height*0.1,
                    maxHeight: size.height*0.1,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _title,
                    style: TextStyle(
                      color: Colors.black,
                    ),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'title',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 13,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 20, 15, 0),
                      // contentPadding: EdgeInsets.only(left: 8,right: 8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 0.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 0.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 0.5,
                        ),
                      ),

                      //filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please write something';
                      }
                    },
                  ),
                ),
              ),
              // getText(
              //   size: size,
              //   hintText: 'Title',
              //   cont: _title,
              //   textStyle: textStyle,
              //   min: 0.1,
              //   max: 0.1,
              //
              // ),

              Padding(
                padding: EdgeInsets.only(top: 10, ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: size.height*0.3,
                    maxHeight: size.height*0.5,

                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _description,
                    style: TextStyle(
                      color: Colors.black,
                    ),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 13,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(8, 20, 15, 0),
                      // contentPadding: EdgeInsets.only(left: 8,right: 8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 0.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 0.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 0.5,
                        ),
                      ),

                      //filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),

                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please write something';
                      }
                    },
                  ),
                ),
              ),

              // getText(
              //   size: size,
              //   hintText: 'Description',
              //   cont: _description,
              //   textStyle: textStyle,
              //   textInputtype: textInputType,
              //   min: 0.1,
              //   max: 0.5,
              // ),
              Row(
                children: [
                  getButton(
                    size: size,
                    text: 'Save',
                  ),
                  getButton(
                    size: size,


                    text: 'Clear',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getButton({Size? size, String? text, TextStyle? textStyle}) {
    return (Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 2, left: 2),
      child: Container(
        height: size!.height * 0.05,
        width: size.width * 0.455,
        child: RaisedButton(
          onPressed: () {
            // if(_key.currentState!.validate()){
            //   print('validated');
            // }
            if(text == "Save") {
              if(_key.currentState!.validate()){
                // print(_auth.currentUser!.uid.toString());
                // print(_title.text);
                // print(_description.text);
                // _methods.delay(context);
                // _methods.saveData(_title.text, _description.text,);


                print('validated and save');
              }
            }
            else {
              print('clear');
             // _methods.clearData(_title,_description);
            }


          },
          color: Colors.deepPurpleAccent,
          child: Center(
            child: Text(
              text!,
              style: textStyle,
            ),
          ),
        ),
      ),
    ));
  }
}
