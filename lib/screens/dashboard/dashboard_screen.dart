import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlingo/bloc/dashboard/dashboard_bloc.dart';
import 'package:mlingo/configs/app_color.dart';
import 'package:mlingo/configs/new_app_theme.dart';
import 'package:mlingo/screens/translation_form/key_form_screen.dart';
import 'package:mlingo/utils/constants/string_constants.dart';
import 'package:mlingo/widgets/primary_button.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/spacing.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<DashboardBloc>().add(const FetchDashboard());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDashboardHorizontalPadding,
                vertical: kDashboardVerticalPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(StringConstants.kMlingo,
                            style: Theme.of(context)
                                .textTheme
                                .dataTableNameTextStyle
                                .copyWith(fontWeight: FontWeight.w900)),
                        const Spacer(),
                        PrimaryButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AddNewKey(
                                            isEdit: false,
                                          )));
                            },
                            buttonTitle: StringConstants.kAdd,
                            buttonWidth: kAddButtonWidth)
                      ]),
                  const SizedBox(height: kGeneralSizedBoxHeight),
                  BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                    if (state is DashboardFetched) {
                      if (state.fetchDashboardModel.data.isNotEmpty) {
                        return Expanded(
                            child: DataTable2(
                                minWidth: kMinWidthDataTable,
                                isVerticalScrollBarVisible: true,
                                columnSpacing: kColumnSpacing,
                                fixedLeftColumns: 1,
                                fixedCornerColor: Colors.white,
                                fixedColumnsColor: Colors.white,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(kCircularRadius)),
                                    border: Border.all(color: Colors.black12)),
                                dataTextStyle: Theme.of(context)
                                    .textTheme
                                    .tableDataTextStyle,
                                headingTextStyle: Theme.of(context)
                                    .textTheme
                                    .dataTableHeadingTextStyle,
                                showCheckboxColumn: true,
                                dividerThickness: kDividerThickness,
                                columns: List.generate(
                                    state.fetchDashboardModel.data[0].keys.length,
                                    (index) {
                                  return DataColumn2(
                                      label: Text(
                                          state.fetchDashboardModel.data[0].keys
                                              .toList()[index],
                                          softWrap: true));
                                }),
                                rows: List.generate(
                                    state.fetchDashboardModel.data.length,
                                    (index) => DataRow2(
                                        onTap: () {
                                          AddNewKey.addNewKeyMap = {
                                            "key": state.fetchDashboardModel
                                                .data[index]["key"],
                                            "translations": [
                                              {
                                                "language": "English",
                                                "translation": state
                                                    .fetchDashboardModel
                                                    .data[index]["English"]
                                              },
                                              {
                                                "language": "German",
                                                "translation": state
                                                    .fetchDashboardModel
                                                    .data[index]["German"]
                                              },
                                              {
                                                "language": "Hindi",
                                                "translation": state
                                                    .fetchDashboardModel
                                                    .data[index]["Hindi"]
                                              },
                                            ]
                                          };
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const AddNewKey(
                                                            isEdit: true,
                                                          )));
                                        },
                                        cells: List.generate(
                                            state.fetchDashboardModel.data[0]
                                                .keys.length,
                                            (cellIndex) => DataCell(Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                state.fetchDashboardModel
                                                    .data[index][state.fetchDashboardModel.data[0].keys.toList()[cellIndex]]
                                                    .toString(),
                                                softWrap: true)))))));
                      } else {
                        return Expanded(
                            child: Center(
                                child: Text('Add your first key and language!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .formHeadingTextStyle
                                        .copyWith(color: Colors.black26))));
                      }
                    } else if (state is DashboardFetching) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is DashboardNotFetched) {
                      return const Text('Errorrr!!!!!!!!');
                    }
                    return const SizedBox.shrink();
                  })
                ])));
  }
}
