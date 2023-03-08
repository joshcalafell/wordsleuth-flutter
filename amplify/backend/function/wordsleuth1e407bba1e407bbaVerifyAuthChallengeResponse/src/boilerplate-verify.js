function verifyAuthChallengeResponse(event) {
  if (
    event.request.privateChallengeParameters.answer ===
    event.request.challengeAnswer
  ) {
    event.response.answerCorrect = true;
  } else {
    event.response.answerCorrect = false;
  }
}

export async function handler(event) {
  verifyAuthChallengeResponse(event);
}
