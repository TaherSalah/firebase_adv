// ignore_for_file: file_names

class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "تعلم العربية بودكاست",
    image: "assets/images/image1.png",
    desc: "استمع الي مواقف وحورارت باللغة العربية اينما كنت .",
  ),
  OnBoardingContents(
    title: "تعلم العربية بودكاست",
    image: "assets/images/image2.png",
    desc: "موضوعات متنوعة وحوارات شيقة تناسب كل المجالات والاشخاص.",
  ),
  OnBoardingContents(
    title: "تعلم العربية بودكاست",
    image: "assets/images/image3.png",
    desc:
        "يمكنك التعلم في أي مكان حتي ولو كنت غير متصل بالانترنت حمل الملفات واستمع اليها لاحقا.",
  ),
];
