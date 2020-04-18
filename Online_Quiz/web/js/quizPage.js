/* global timeDisplay */
timeRemaining = 0;
timeDisplay = null;
questionPos = null;
currentQuiz = 0;
preQuiz = 0;
currentDiv = null;
preDiv = null;
testing = 0;
numOfQuiz = 0;
submit = false;

var nextQuestion = function () {
    //save previous question
    preQuiz = currentQuiz - 1;
    if (currentQuiz < numOfQuiz) {
        currentDiv = document.getElementById("q" + currentQuiz);
        // hidden previous question
        if (preQuiz >= 0) {
            preDiv = document.getElementById("q" + preQuiz);
            preDiv.classList.add("hidden");
        }
        // show current question
        currentDiv.classList.remove("hidden");
        // show number of of quiz on view
        questionPos.textContent = "Question: " + (currentQuiz + 1) + "/" + numOfQuiz;
        currentQuiz = currentQuiz + 1;
    } else {
        //refresh when show last question
        document.getElementById("q" + (currentQuiz - 1)).classList.add("hidden");
        currentQuiz = 0;
        // show number of of quiz on view
        questionPos.textContent = "Question: " + (currentQuiz + 1) + "/" + numOfQuiz;
        document.getElementById("q" + 0).classList.remove("hidden");
        currentQuiz = currentQuiz + 1;

    }

};
// delete quiz
function deleteQuiz(id) {
// confirm alert
var result = confirm("Want to delete?");
    if (result) {
        window.location.href = 'ManageQuizServlet?del='+ id;
    }
}


//count time
function startTimer(duration) {
    var timer = duration;
    var minutes, seconds;
    // do count time
    var count = setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
        // display time on view
        timeDisplay.textContent = minutes + ":" + seconds;
        var time = timer;
        if (timer-- <= 0) {
            //auto submit when 
            if (time === 0) {
                testing = 0;
//                document.getElementById("quizForm").submit();
            }
            testing = -1;
            document.getElementById("invalidTime").value = testing;
            // stop  count
             clearInterval(count);
        }
    }, 1000);
}
var quizStart = function () {
    testing = 1;
    // step to first question
    nextQuestion();
    this.startTimer(timeRemaining);
};

// set state sunbmit
 var submitForm = function(){
    console.log('submit work');
    submit = true;
};

// alert when out page while do testing
window.onbeforeunload = function () {
    // leave page but with out submit
    if (testing === 1 && submit === false) {
        return "Bạn có chắc chắn không?";
    }
};

var setNumOfQuiz = function (n) {
    //get number question
    numOfQuiz = n;
    //calculate total time base on number of quiz
    timeRemaining = n * 5;
    timeDisplay = document.getElementById("timeDisplay");
    questionPos = document.getElementById("qustionPos");
};