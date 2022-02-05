import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notekeeper/screens/edit_note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notekeeper/screens/methods.dart';


class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {


  late String _docId;
  late String _docId2;

  late final QuerySnapshot querySnapshot ;

  FirebaseAuth _auth = FirebaseAuth.instance;
  MethodsHandler _methods=MethodsHandler();
  int count=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Todos'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              _methods.signOut(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.logout),

            ),
          )
        ],

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditNote(title: '',desc: '',status: 'Save',docId: '',)));
        },
        tooltip: 'Add Notes',
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<QuerySnapshot>(
        // <2> Pass `Future<QuerySnapshot>` to future
          future: FirebaseFirestore.instance.collection('note').get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // <3> Retrieve `List<DocumentSnapshot>` from snapshot

              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return
                ListView(
                    children: documents
                        .map((doc) =>
                    _auth.currentUser!.uid.toString() == doc["uid"].toString() ?
                    GestureDetector(
                      onTap: (){

                      },
                      child: Card(
                        child: ListTile(
                          title: Text(doc['title']),
                          subtitle: Text(doc['description']),
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            child: Icon(Icons.play_arrow,),
                          ),

                          trailing: GestureDetector(

                              onTap: (){

                                documents.forEach((element) {
                                  _docId = element.reference.id;
                                });
                                print(_docId);

                                _methods.delete(docId: _docId.toString());
                              },
                              child: Icon(Icons.delete)
                          ),
                          onTap: (){
                            documents.forEach((element) {
                              _docId = element.reference.id;
                            });
                            print(_docId.toString());
                            _docId2 = _docId ;
                            if(_docId != null ) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => EditNote(
                                    title: doc['title'],
                                    desc: doc['description'],
                                    status: 'Update',
                                    docId:_docId.toString(),
                                  ),
                                  transitionsBuilder: (c, anim, a2, child) =>
                                      FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 0),
                                ),
                              );
                            }
                            else {
                              Fluttertoast.showToast(
                                msg: "Id not found",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 4,
                              );
                            }

                          },
                        ),
                      ),
                    ) : Container(height: 0,)
                    )
                        .toList());
            }
            else if (snapshot.hasError) {
              return Text('Its Error!');
            }
            else {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
          }

      ),
    );

  }
}
