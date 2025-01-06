class Contact {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String mobile;
  final String pictureUrl;
  final Address address;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.mobile,
    required this.pictureUrl,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    final results = json['results'][0];
    final name = results['name'];
    final location = results['location'];
    
    return Contact(
      id: results['login']['uuid'],
      firstName: name['first'],
      lastName: name['last'],
      email: results['email'],
      phone: results['phone'],
      mobile: results['cell'],
      pictureUrl: results['picture']['large'],
      address: Address(
        street: '${location['street']['number']} ${location['street']['name']}',
        city: location['city'],
        state: location['state'],
        country: location['country'],
      ),
    );
  }
}

class Address {
  final String street;
  final String city;
  final String state;
  final String country;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });
}