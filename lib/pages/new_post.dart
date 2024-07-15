import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  bool loading = false;

  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
  final postsRef = FirebaseStorage.instance.ref().child('posts');
  final ImagePicker _picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null) return "Please enter a title";
                        if (value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: contentController,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Content',
                      ),
                      validator: (value) {
                        if (value == null) return "Please enter a title";

                        if (value.isEmpty) {
                          return 'Please enter the content';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: image != null
                          ? Image.file(File(image!.path))
                          : ElevatedButton(
                              onPressed: () async {
                                XFile? pickedImage = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  image = pickedImage;
                                });
                              },
                              child: const Text('Add Image'),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState != null) {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });

                            String? imageUrl = null;

                            if (image != null) {
                              // Add Image to firebase storage
                              final imageRef = postsRef.child(
                                  "${titleController.text} ${DateTime.now()}");

                              File imageFile = File(image!.path);

                              await imageRef.putFile(imageFile);

                              imageUrl = await imageRef.getDownloadURL();
                            }

                            // Add to firestore
                            CollectionReference posts =
                                FirebaseFirestore.instance.collection('posts');

                            await posts.add({
                              "title": titleController.text,
                              "content": contentController.text,
                              "imageUrl": imageUrl,
                              "date": DateTime.now()
                            });

                            setState(() {
                              loading = false;
                              Navigator.pop(context);
                            });
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
