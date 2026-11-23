import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/profile_repository.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/providers/profile_repository_provider.dart';
import '../../../../core/widgets/personal_info_form.dart';
import 'settings_card.dart';

class PersonalInformations extends ConsumerStatefulWidget {
  const PersonalInformations({super.key});

  @override
  ConsumerState<PersonalInformations> createState() =>
      _PersonalInformationsState();
}

class _PersonalInformationsState extends ConsumerState<PersonalInformations> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return SettingsCard(
      cardLabel: context.locale.personalinformations,
      items: [
        _isEditing
            ? PersonalInfoForm(
                onDone: () {
                  setState(() {
                    _isEditing = false;
                  });
                },
                onCanceled: () {
                  setState(() {
                    _isEditing = false;
                  });
                },
              )
            : ProfileView(
                profile: profile,
                onChange: () {
                  setState(() {
                    _isEditing = true;
                  });
                },
              ),
      ],
    );
  }
}

class ProfileView extends StatelessWidget {
  final Profile profile;
  final VoidCallback onChange;
  const ProfileView({super.key, required this.profile, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(borderRadius: .circular(8.r)),
          clipBehavior: .antiAlias,
          child: Image.asset('assets/images/avatar1.jpg'),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                profile.name,
                style: context.themeData.textTheme.titleLarge,
                overflow: .ellipsis,
              ),
              Text(
                profile.shopName,
                style: context.themeData.textTheme.titleMedium,
                overflow: .ellipsis,
              ),
              Text(
                profile.phoneNumber,
                style: context.themeData.textTheme.titleMedium,
                overflow: .ellipsis,
              ),
            ],
          ),
        ),
        IconButton(onPressed: onChange, icon: Icon(Icons.settings)),
      ],
    );
  }
}
