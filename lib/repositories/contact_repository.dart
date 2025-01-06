import 'package:flutter_application_test/core/constants/api_constants.dart';
import 'package:flutter_application_test/core/services/http_service.dart';
import 'package:flutter_application_test/models/contact_model.dart';


class ContactRepository {
  final HttpService _httpService;

  ContactRepository(this._httpService);

  Future<List<Contact>> getContacts(int page, int results) async {
    final response = await _httpService.get(
      '${ApiConstants.baseUrl}?results=$results&page=$page'
    );
    
    return (response['results'] as List)
        .map((json) => Contact.fromJson({'results': [json]}))
        .toList();
  }
}