import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/suite_detail_page.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_card_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/shared/back_button_custom_widget.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';

class SuitesListPage extends StatefulWidget {
  final String title;
  final List<SuiteModel> suites;
  const SuitesListPage({super.key, required this.suites, required this.title});

  @override
  State<SuitesListPage> createState() => _SuitesListPageState();
}

class _SuitesListPageState extends State<SuitesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          leading: BackButtonCustomWidget(),
          title: Text(widget.title)),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          itemCount: widget.suites.length,
          padding: EdgeInsets.all(PaddingSize.medium),
          itemBuilder: (context, index) {
            final suite = widget.suites[index];
            return SuiteCardWidget(
              onTap: () => goNewPage(
                fullscreenDialog: true,
                context: context,
                child: SuiteDetailPage(
                  suite: suite,
                  motelName: widget.title,
                ),
              ),
              suite: widget.suites[index],
              motelName: widget.title,
            );
          },
        ),
      ),
    );
  }
}
