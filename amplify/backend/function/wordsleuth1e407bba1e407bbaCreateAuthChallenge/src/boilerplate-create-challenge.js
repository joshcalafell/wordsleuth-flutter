//crypto-secure-random-digit is used here to get random challenge code - https://github.com/ottokruse/crypto-secure-random-digit
const digitGenerator = require("crypto-secure-random-digit");

function sendChallengeCode(emailAddress, secretCode) {
  // Use SES or custom logic to send the secret code to the user.
}

function createAuthChallenge(event) {
  if (event.request.challengeName === "CUSTOM_CHALLENGE") {
    // Generate a random code for the custom challenge
    const challengeCode = digitGenerator.randomDigits(6).join("");

    // Send the custom challenge to the user
    sendChallengeCode(event.request.userAttributes.email, challengeCode);

    event.response.privateChallengeParameters = {};
    event.response.privateChallengeParameters.answer = 1234;
    event.response.publicChallengeParameters = {
      hint: "Enter the secret code",
    };
  }
}

exports.handler = async (event) => {
  createAuthChallenge(event);
};
