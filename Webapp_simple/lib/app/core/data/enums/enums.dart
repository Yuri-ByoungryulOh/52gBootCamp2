// 로그인 타입에 대한 enum
enum AutoLoginType {
  none(name: 'none'),
  seveId(name: 'seveId'),
  autoLogin(name: 'autoLogin');

  const AutoLoginType({
    required this.name,
  });

  factory AutoLoginType.getByName(String name) {
    return AutoLoginType.values.firstWhere((value) => value.name == name, orElse: () => AutoLoginType.none);
  }

  final String name;
}