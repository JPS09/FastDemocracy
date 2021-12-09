const updatePoll = () => {
  const selectedForm = document.querySelector("#edit_poll")
  const selectedButtonUpdate = document.querySelector(".button_update_poll")
  if (selectedButtonUpdate) {
    selectedButtonUpdate.addEventListener("click", (event) => {
      selectedForm.submit()
    })
  }
}
export { updatePoll }
