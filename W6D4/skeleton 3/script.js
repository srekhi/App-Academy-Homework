document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };


  const addCityInput = (e) => {
    e.preventDefault();
    // const inputBox = e.currentTarget; //instead of grabbing the child in relation to the event. just query the entire doc.
    const inputBox = document.getElementsByClassName("favorite-input")[0];
    const inputVal = inputBox.value;
    inputBox.value = ""; //cleared it

    const li = document.createElement("li");
    li.textContent = inputVal;
    li.addEventListener("click", toggleLi);
    document.getElementById('restaurants').appendChild(li); //add to list
  };

  const displayForm = (e) => {
    let formDiv = document.getElementsByClassName("photo-form-container hidden")[0];
    formDiv.className = "photo-form-container";
  };

  const addPhotoToList = (e) => {
    e.preventDefault();
    const photoURL = document.getElementsByClassName("photo-url-input")[0];
    const photoList = document.getElementsByClassName("dog-photos")[0];
    const inputText = photoURL.value;
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = inputText;
    li.appendChild(img);
    photoList.append(li);
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items
  const cityInputForm = document.getElementById("favorite-places-form");
  cityInputForm.addEventListener("submit", addCityInput);




  // adding new photos

  // --- your code here!

  const photoForm = document.getElementById("photo-form");
  photoForm.addEventListener("submit", addPhotoToList );


  const togglePhotoButton = document.getElementsByClassName("photo-show-button")[0];
  togglePhotoButton.addEventListener("click", displayForm);


});
