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

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addFavoritePlace = (event) => {
    event.preventDefault();

    const placeEl = document.querySelector(".favorite-input");
    const favoritePlace = placeEl.value;
    placeEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement('li');
    li.textContent = favoritePlace;

    ul.appendChild(li);
  };

  const placesForm = document.querySelector(".list-container form");
  placesForm.addEventListener("submit", addFavoritePlace);




  // adding new photos
  const togglePhotoButton = document.querySelector(".photo-show-button");
  const photoForm = document.querySelector(".photo-form-container");

  togglePhotoButton.addEventListener('click', () => {
    photoForm.classList.toggle("hidden");
  });

  const addPhoto = (event) => {
    event.preventDefault();

    const imgForm = document.querySelector('.photo-url-input');
    const imgUrl = imgForm.value;
    imgForm.value = "";
    photoForm.classList.toggle("hidden");

    const ul = document.querySelector(".dog-photos");
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.src = imgUrl;
    ul.appendChild(li).appendChild(img);
  };

  photoForm.addEventListener("submit", addPhoto);




});