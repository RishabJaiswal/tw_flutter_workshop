import 'package:flutter/material.dart';
import 'package:playground/src/typography_page.dart';

class ComponentsList extends StatelessWidget {
  const ComponentsList({super.key});

  final components = const [
    ComponentListItemModel(
      title: 'Typography',
      description: 'All the defined types',
      routeName: TypographyPage.route,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: components.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        final model = components[index];
        return ListTile(
          title: Text(model.title),

          //
          subtitle: Text(model.description),

          //
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onTap: () {
            Navigator.pushNamed(context, model.routeName);
          },
        );
      },
    );
  }
}

class ComponentListItemModel {
  const ComponentListItemModel({
    required this.title,
    required this.description,
    required this.routeName,
  });

  final String title;
  final String description;
  final String routeName;
}
