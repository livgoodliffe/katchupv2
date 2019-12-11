export default () => {

  const wishlist = document.querySelector('#wishlist');
  const wishlistButton = document.querySelector('#wishlist_button');

  const visited = document.querySelector('#visited');
  const visitedButton = document.querySelector('#visited_button');

  if (wishlistButton) {
   wishlistButton.addEventListener('click', () => {

    console.log("wishlist selected");
    visited.classList.add('hidden');
    wishlist.classList.remove('hidden');
   });
  }

 if (visitedButton) {
   visitedButton.addEventListener('click', () => {

    console.log("visited selected");

    visited.classList.remove('hidden');
    wishlist.classList.add('hidden');
   });
 }
};
