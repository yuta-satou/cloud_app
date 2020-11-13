if (!document.URL.match( /orders/ )){
  window.addEventListener('load', function(){
    function price(revenue_sum){
      const renderDom = document.getElementById("achievement-bar");
      renderDom.innerHTML = `<progress value=${revenue_sum} ></progress>`;
    }
    const render = document.getElementById("achievement");
    price(render.attributes[2].value / 100);
  })
}