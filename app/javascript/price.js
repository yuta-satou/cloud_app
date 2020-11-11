if (document.URL.match( /orders/ )){
  window.addEventListener('load', function(){
    const pushUpKey = document.getElementById("item-price");
    let obj = document.getElementsByClassName( "price-box-list" );
    let revenue = 0;
    let revenue_num = 0;
    let revenue_sum = 0;
    if (pushUpKey != null){
      pushUpKey.addEventListener('keyup', function(){
        revenue_num = parseInt(pushUpKey.value, 10)
        if(isNaN(revenue_num)) revenue_num = 0;
        revenue_sum = revenue_num + revenue;
        document.getElementById( "price-sum" ).innerHTML = revenue_sum.toLocaleString();
        price(revenue_sum);
      });
    }


    let checkbox = document.querySelectorAll('input[type="checkbox"]');
    checkbox[0].addEventListener('change', function(){
      if (checkbox[0].checked){
        revenue += parseInt(500);
        obj[0].style.backgroundColor = '#E3FFE8';
      }else{
        revenue -= parseInt(500);
        obj[0].style.backgroundColor = '#ffffff';
      }
      revenue_sum = revenue_num + revenue;
      document.getElementById( "price-sum" ).innerHTML = revenue_sum.toLocaleString();
      price(revenue_sum);
    })
    checkbox[1].addEventListener('change', function(){
      if (checkbox[1].checked){
        revenue += parseInt(8000);
        obj[1].style.backgroundColor = '#E3FFE8';
      }else{
        revenue -= parseInt(8000);
        obj[1].style.backgroundColor = '#ffffff';
      }
      revenue_sum = revenue_num + revenue;
      document.getElementById( "price-sum" ).innerHTML = revenue_sum.toLocaleString();
      price(revenue_sum);
    })

    function price(revenue_sum){
      const renderDom = document.getElementById("charge-form");
      const priceObj = `<input value=${revenue_sum} name='price_id' type="hidden"> `;
      renderDom.insertAdjacentHTML("beforeend", priceObj);
    }
  })
}