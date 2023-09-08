import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';
import 'package:simple_webapp/app/core/widgets/image_box.dart';
import 'package:simple_webapp/app/domain/signup/controller/signup_controller.dart';

// 버튼을 클릭하면 SignupController setProfileImage 를 호출해 이미지를 선택받아 업로드 하고 표시 한다
class SignupProfileImage extends ConsumerWidget {
  const SignupProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(SignupController.provider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: (signupController.newUser.profileImage).isNotEmpty,
          child: ImageBox(signupController.newUser.profileImage),
        ),
        const SizedBox(height: 6),
        Click(
          onTap: signupController.setProfileImage,
          child: Container(
            width: 110,
            alignment: Alignment.center,
            height: 35,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: Decorations.boxDecoration(
              bgColor: Colors.white,
              borderColor: const Color(0xff0091F9),
              radius: 4,
            ),
            child: Row(
              children: const [
                Icon(Icons.upload, color: Color(0xff0091F9)),
                SizedBox(width: 6),
                Text('파일 추가', style: TextStyle(color: Color(0xff0091F9), height: 1)),
              ],
            ),
          ),
        )
      ],
    );
  }
}