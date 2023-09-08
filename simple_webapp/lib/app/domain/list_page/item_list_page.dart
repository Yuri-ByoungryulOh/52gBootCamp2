import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/data/models/user_model.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';
import 'package:simple_webapp/app/core/widgets/contents_frame.dart';
import 'package:simple_webapp/app/core/widgets/custom_app_bar.dart';
import 'package:simple_webapp/app/core/widgets/image_box.dart';
import 'package:simple_webapp/app/domain/list_page/controller/item_list_controller.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

class ItemListPage extends ConsumerWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider를 통해 controller를 가져온다.
    final controller = ref.watch(ItemListController.provider);
    return ContentsFrame(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      // 로고, 사용자 프로필 사진, 로그아웃 버튼을 표시하는 상단 appbar 이다
      appBar: CustomAppBar(
        titleWidget: const ImageBox('assets/images/gs_logo.png', width: 80),
        rightWidget: Row(
          children: [
            Visibility(
              visible: (controller.appService.loginUser.profileImage).isNotEmpty,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: ImageBox(controller.appService.loginUser.profileImage).image(context),
              ),
            ),
            const SizedBox(width: 10),
            Click(onTap: controller.logout, child: const Text('로그아웃')),
          ],
        ),
      ),
      // 사용자 목록을 표시하는 리스트뷰 이다
      child: ListView.separated(
        itemCount: controller.userList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, thickness: 1),
        itemBuilder: (BuildContext context, int index) {
          return _buildUserBox(
            controller.userList[index],
            onTap: () {
              controller.selectedUser = controller.userList[index];
              ref.read(AppRouter.provider).push(AppRouteConstants.itemDetail);
            },
          );
        },
      ),
    );
  }

  // 사용자 정보를 표시하는 위젯이다
  Widget _buildUserBox(UserModel user, {void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          alignment: Alignment.center,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Image.network(
                user.profileImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('noimage', style: TextStyle(color: Colors.red));
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(user.name), Text(user.email, style: const TextStyle(color: Colors.grey))],
                ),
              ),
              Click(
                onTap: onTap,
                child: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}