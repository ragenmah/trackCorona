class FAQS {
  final String question;
  final String questionNP;
  final String answer;
  final String answerNP;
  final String category;

  FAQS(
      {this.question,
      this.questionNP,
      this.answer,
      this.answerNP,
      this.category});

  factory FAQS.fromJson(Map<String, dynamic> json) {
    return FAQS(
      question: json["question"],
      questionNP: json["question_np"],
      answer: json["answer"],
      answerNP: json["answer_np"],
      category: json["category"],
    );
  }
}
