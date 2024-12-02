import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr.faq,
          style:
              context.text.titleMedium!.copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: 16.horPad,
            child: TextField(
              decoration: InputDecoration(
                hintText: context.tr.search,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: 25.radius,
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
          ),
          10.hGap,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: 0.syPad,
              itemCount: 3,
              separatorBuilder: (context, index) => 10.hGap,
              itemBuilder: (context, index) {
                return CustomExpansionTileWidget(
                  index: 0,
                  title: 'How do i change language?',
                  content:
                      'Go to Settings » Language and select the appropriate language',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget({
    super.key,
    required this.index,
    required this.title,
    required this.content,
  });
  final int index;
  final String title;
  final String content;

  @override
  State<CustomExpansionTileWidget> createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOpen = !_isOpen;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  color: AppColors.primaryColor,
                  _isOpen ? Icons.expand_less : Icons.expand_more,
                ),
                8.wGap,
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isOpen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
