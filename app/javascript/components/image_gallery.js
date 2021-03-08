const showGalery = () => {
  // Get all images
  const workImages = document.querySelectorAll(".work-img");

  // Get the expanded image
  const expandImg = document.getElementById("expandedImg");

  workImages.forEach((image) => {
    image.addEventListener("click", (event) => {
      // Use the same src in the expanded image as the image being clicked on from the grid
      expandImg.src = image.src;
      // Use the value of the alt attribute of the clickable image as text inside the expanded image
      expandImg.alt = image.alt;
    });
  });
}

export { showGalery };
