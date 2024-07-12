
import 'package:get/get.dart';
import 'package:life_bookshelf/models/onboarding/onboarding_model.dart';
import 'package:life_bookshelf/services/onboarding/onboarding_service.dart';

class OnboardingViewModel extends GetxController{

var currentQuestionIndex = 0.obs;
// 답을 저장할 List<String>형태의 .obs
var answers = <String>[].obs;



  List<String> questions = [
    "여행자님의 이름을 알려주세요",
    "여행자님의 나이가 궁금해요",
    "여행자님의 성별은 뭔가요?",
    "여행자님은 자식이 있으신가요?",
    "질문에 모두 답해주셨네요!",
  ];

  List<String> questionsDetails = [
    "이름이란건 생각보다 많은 걸 담고있는 법이죠. 여행자님의 이름은 무엇인가요?",
    "나이는 단지 숫자일 뿐이죠. 여행자님께서 얼마나 멋진 경험을 쌓아오셨는지 궁금해요. 여행자님의 나이는 어떻게 되시나요?",
    "성별은 우리의 일부일 뿐이지만, 사람마다 특별한 이야기를 담고 있죠. 여행자님의 성별은 어떻게 되시나요?",
    "자녀가 있다면 그만큼 삶이 풍요로워지죠. 여행자님의 가족 이야기가 궁금해요. 자녀가 있으신가요?",
    "답해주신 내용으로 책을 만들기 위한 가장 적절한 챕터를 만들고있어요..."
      ];

  final OnboardingApiService _userService = OnboardingApiService();

  void updateUserInformation() {
    if (answers.length >= 4) {
      OnUserModel user = OnUserModel(
        name: answers[0],
        bornedAt: answers[1],
        gender: answers[2],
        hasChildren: answers[3].toLowerCase() == 'yes',
      );

      _userService.updateUser(user).catchError((error) {
        // 오류 처리 로직
        print("Error updating user: $error");
      });
    } else {
      print("Not enough information to update user.");
    }
  }

}