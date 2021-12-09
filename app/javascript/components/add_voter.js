const addVoterField = () => {
  const selectedForm = document.querySelector("#edit_poll")
  const addVoterButton = document.querySelector(".add_voter")
  const newVoter = `<div class="form-group string optional poll_voters"><label class="string optional" for="poll_voters">Voters</label><input class="form-control string optional" value="" name="voters[]" type="text" id="poll_voters"><small class="form-text">10-200 characters</small></div>`
  if (addVoterButton) {
    addVoterButton.addEventListener('click', (event) => {
        addVoterButton.insertAdjacentHTML("beforebegin", newVoter);


        console.log(event.currentTarget);
      });
    }
}
export { addVoterField }
