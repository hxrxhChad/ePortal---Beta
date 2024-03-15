indexbox -> primary?
primarybutton -> outline?
optionbox -> outline?
secondarybutton
timerbox

question page :
title
Row -> indexbox-list & timerbox
Row -> questionbox-column & optionbox-column
Row -> exit-secondarybutton , previous-secondarybutton, next-primarybutton

pages:
question page
setting page
stat page
exam search page

states-----
question: int.questionSelected, int.answerSelected

**TODO**

1. _shared preferences instead of hydrated bloc_
2. _complete the addtestpage_ **atleast**

_--------------------------------------------------------------------_

🐷 **entities and models** :

1. _users_

- string.authId
- string.name
- string.organizationName
- string.emailId
- string.password
- int.time
- string.imageUrl
- bool.admin

2. _tests_

- string.testId
- string.testName
- string.testDescription
- int.testTimeStamp
- string.testAuthor
- string.testOrganization
- testParticipants[]
- string.testCode
- int.dates[]
<!-- - string.eligibleCandidates[] -->
- string.testSyllablus
- string.testEligibilityDocuments
- string.testFeedback[]
- string.testResultDate
- string.answerSheet

3. _questions_

- string.questionId
- string.questionText
- string.questionImage
- string.rightOptionId
- string.testId
- int.testMarks
- int.negativeMarks
- int.questionIndex

4. _options_

- string.optionId
- string.optionText
- string.optionImage
- string.questionId
- int.optionIndex

5. _scores_

- string.scoreId
- string.scorerId
- string.testId
- string.optionSelected[]
- int.testSubmittedTime
- int.testTimeTaken
- int.totalSum
- int.totalNegativeScore
- string.totalScore
- int.maximumScore

6. _feedbacks_

- string.feedbackId
- string.testId
- string.testFeedback
- string.FeedbackerId
- int.feedbackTime

7. _results_ { ... if successfully able to draw realtime data of score then result is not needed to be displayed seperately }

- string.resultsId
- string.testId
- string.scoreId
