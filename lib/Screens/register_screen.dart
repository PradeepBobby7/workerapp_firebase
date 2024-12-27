import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workwala_workers/worker_info/worker_details.dart';

class WorkerRegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedCategory = 'Painter'; // Default category

  final categories = ['Painter', 'Mechanic', 'Daily Wage'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Worker Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration:const  InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                selectedCategory = value!;
              },
              decoration:const  InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final worker = WorkerDetails(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  category: selectedCategory,
                  phoneNUmber: phoneController.text,
                );

                await FirebaseFirestore.instance
                    .collection('workers')
                    .doc(worker.id)
                    .set(worker.toMap());

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Worker registered successfully!')));
              },
              child:const  Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}