const sendAquestion = () => {
  const selectedForm = document.querySelector("#new_question")
  const selectedButtonQuestion = document.querySelector(".button_send_question")
  if (selectedButtonQuestion) {
    selectedButtonQuestion.addEventListener("click", (event) => {
      selectedForm.submit()
    })
  }
}
export { sendAquestion }
