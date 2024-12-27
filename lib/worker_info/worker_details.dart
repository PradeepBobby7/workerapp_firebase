class WorkerDetails {
  String name;
  String id;
  String category;
  String phoneNUmber;

  WorkerDetails(
      {required this.name,
      required this.id,
      required this.category,
      required this.phoneNUmber});
  Map<String, dynamic> toMap() {
    return {'name': name, 'id': id, 'category': category, 'phone': phoneNUmber};
  }

  static WorkerDetails fromMap(Map<String, dynamic> map) {
    return WorkerDetails(
        name: map['name'] ?? '',
        id: map['id'] ?? '',
        category: map['category'] ?? '',
        phoneNUmber: map['phone'] ?? '');
  }
}