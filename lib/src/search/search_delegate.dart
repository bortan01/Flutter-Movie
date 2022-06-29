import 'dart:io';

import 'package:flutter/material.dart';

class MovieSearDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 140,
        ),
      );
    }

    return  Container();
  }
}
