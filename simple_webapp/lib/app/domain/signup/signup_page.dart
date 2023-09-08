import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:simple_webapp/app/core/widgets/contents_frame.dart';
import 'package:simple_webapp/app/core/widgets/custom_app_bar.dart';
import 'package:simple_webapp/app/core/widgets/custom_textfield.dart';
import 'package:simple_webapp/app/core/widgets/flex_button.dart';
import 'package:simple_webapp/app/core/widgets/image_box.dart';
import 'package:simple_webapp/app/core/widgets/section_card.dart';
import 'package:simple_webapp/app/domain/signup/controller/signup_controller.dart';
import 'package:simple_webapp/app/domain/signup/widgets/signup_password_input_box.dart';
import 'package:simple_webapp/app/domain/signup/widgets/signup_profile_image.dart';
import 'package:simple_webapp/app/routes/app_router.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(SignupController.provider);

    // ContentsFrame 은 화면 전체를 감싸는 커스텀 레이아웃 위젯이다
    return ContentsFrame(
      backGroundColor: const Color(0xffE2E2E2),

      // CustomAppBar 는 AppBar 를 커스텀하기 위한 위젯이다
      appBar: CustomAppBar(
        title: '회원가입',
        rightWidget: const ImageBox('assets/images/close.png'),
        rightWidgetOnTap: () => ref.read(AppRouter.provider).go(AppRouteConstants.login),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // SingleChildScrollView 는 스크롤이 가능한 위젯이다
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // SectionCard 는 섹션별로 카드를 감싸는 커스텀 위젯이다
                SectionCard(
                  title: '아이디로 사용할 이메일을 입력하세요.',
                  // CustomTextfield 는 TextFormField 를 커스텀하기 위한 위젯이다
                  child: CustomTextfield(
                    initialValue: controller.newUser.email,
                    hint: '52g@gs.com',
                    borderType: BorderType.all,
                    validators: [
                      Validators.required('이메일을 입력하세요.'),
                      Validators.email('올바른 이메일을 입력하세요.'),
                    ],
                    onChanged: controller.setUserEmail,
                  ),
                ),
                SectionCard(
                  title: '이름을 입력하세요.',
                  child: CustomTextfield(
                    initialValue: controller.newUser.name,
                    hint: '홍길동',
                    borderType: BorderType.all,
                    validators: [Validators.required('이름을 입력하세요.')],
                    onChanged: controller.setUserName,
                  ),
                ),
                SectionCard(
                  title: '휴대전화번호를 입력해주세요.',
                  child: CustomTextfield(
                    initialValue: controller.newUser.mobile,
                    hint: '휴대전화번호 입력',
                    borderType: BorderType.all,
                    keyboardType: TextInputType.phone,
                    validators: [
                      Validators.required('휴대전화번호를 입력하세요.'),
                      Validators.patternString(
                        r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$',
                        '올바른 휴대전화번호를 입력해주세요.',
                      ),
                    ],
                    onChanged: controller.setUserMobile,
                  ),
                ),
                // SignupProfileImage 는 프로필 이미지를 입력하는 위젯이다
                const SectionCard(
                  title: '프로필 이미지를 입력하세요.',
                  child: SignupProfileImage(),
                ),
                // SignupPasswordInputBox 는 비밀번호를 입력하는 위젯이다
                SectionCard(
                  title: '비밀번호를 설정하세요.',
                  child: SignupPasswordInputBox(),
                ),
                const SizedBox(height: 20),
                // FlexButton 은 버튼을 커스텀하기 위한 위젯이며 회원 가입처리를 위해 onPressed 에 signup 함수를 호출한다
                FlexButton(
                  title: '회원 가입 완료',
                  textStyle: TextStyles.s17W700,
                  bgColor: const Color(0xff0091F9),
                  borderColor: const Color(0xff0091F9),
                  onPressed: controller.signup,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}