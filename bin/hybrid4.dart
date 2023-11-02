import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  const url = 'https://random-data-api.com/api/users/random_user?size=10';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);

      for (var user in users) {
        print("UserId: ${user['uid']}");
        print("First Name: ${user['first_name']}");
        print("Last Name: ${user['last_name']}");
      }
    } else {
      print('Could not load user data, maybe the fetch failed?');
    }
  } catch (e) {
    print('Error: $e');
  }
}
