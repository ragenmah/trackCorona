class Hospital {
  final String name;
  final Map<String, dynamic> location;
  final bool isFull;
  final bool governmentApproved;
  final String contactPerson;
  final String contactPersonNumber;
  final String address;
  final String phone;
  final String website;
  final String email;
  final String notes;
  final String state;
  final String imageUrl;
  final Map<String, dynamic> capacity;

  Hospital({
    this.name,
    this.location,
    this.isFull,
    this.governmentApproved,
    this.contactPerson,
    this.contactPersonNumber,
    this.address,
    this.phone,
    this.website,
    this.email,
    this.notes,
    this.state,
    this.imageUrl,
    this.capacity,
  });
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      name: json["name"],
      location: json["location"],
      isFull: json["is_full"],
      governmentApproved: json["government_approved"],
      contactPerson: json["contact_person"],
      contactPersonNumber: json["contact_person_number"],
      address: json["address"],
      website: json["website"],
      email: json["email"],
      notes: json["notes"],
      state: json["state"],
      imageUrl: json["image_url"],
      capacity: json["capacity"],
    );
  }
}
