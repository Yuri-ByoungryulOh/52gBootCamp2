import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/widgets/contents_frame.dart';
import 'package:simple_webapp/app/core/widgets/custom_app_bar.dart';
import 'package:simple_webapp/app/core/widgets/image_box.dart';
import 'package:simple_webapp/app/core/widgets/section_card.dart';
import 'package:simple_webapp/app/domain/list_page/controller/item_list_controller.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider 를 통해 controller 를 가져온다
    final controller = ref.watch(ItemListController.provider);
    Widget NullImageCofigure(){
      if(controller.selectedUser.profileImage.isNotEmpty){
        return ImageBox(controller.selectedUser.profileImage);
      }
      else{
        return ImageBox('assets/images/close.png');
      }
    }
    return ContentsFrame(
      backGroundColor: const Color(0xffE2E2E2),
      appBar: CustomAppBar(
        title: '사용자 상세',
        rightWidget: const ImageBox('assets/images/close.png'),
        rightWidgetOnTap: () => ref.read(AppRouter.provider).pop(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SectionCard(
                title: '이메일',
                // controller.selectedUser.email 을 통해 선택된 사용자의 이메일을 가져온다
                child: Text(controller.selectedUser.email),
              ),
              SectionCard(
                title: '이름',
                child: Text(controller.selectedUser.name),
              ),
              SectionCard(
                title: '휴대전화번호',
                child: Text(controller.selectedUser.mobile),
              ),
              SectionCard(
                title: '프로필 이미지',
                child: NullImageCofigure()

              ),
              SectionCard(
                title: '주소',
                child: Text(controller.selectedUser.address),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}