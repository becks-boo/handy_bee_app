const homepage = () => {
  const searchbutton = document.getElementById('home-modal');
  searchbutton.addEventListener('click', event => {
    console.log(event);
  });
}

export { homepage };
