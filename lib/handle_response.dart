import 'dart:convert';

dynamic handleResponse(data) {
  if (data is Map) {
    // se for um Map, retorna um Map
    return Map<String, dynamic>.from(data);
  } else if (data is List) {
    // se for um List, retorna uma List
    return List<dynamic>.from(data);
  } else {
    // se não for nem um Map nem um List, retorna null
    return null;
  }
}
