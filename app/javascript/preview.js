if (document.URL.match( /new/ ) && document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    document.getElementById('item-image').addEventListener('change', function(e){
      
      const imageContent = document.querySelector('img');
      if(imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.width = 350;
      blobImage.height = 300;
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
}