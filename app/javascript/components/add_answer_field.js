const addAnswerField = () => {
  const selectedForm = document.querySelector("#new_question")
  const addAnswerButton = document.querySelector(".add_answer")
  const newAnswer = `<div class="form-group string optional question_answers" ><label class="string optional" for="question_answers">Answers</label><input class="form-control string optional" value="" name="answers[]" type="text" id="question_answers"></div>`
  if (addAnswerButton) {
    addAnswerButton.addEventListener('click', (event) => {
      addAnswerButton.insertAdjacentHTML("beforebegin", newAnswer);


      console.log(event.currentTarget);
    });
  }
}
export {addAnswerField}
