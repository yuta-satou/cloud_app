if (document.URL.match( /new/ ) && document.URL.match( /order/ )){
  window.addEventListener('load', function(){
    const pushUpKey = document.getElementById("item-price");
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
        console.log(18000);
        revenue += parseInt(500);
      }else{
        console.log(0);
        revenue -= parseInt(500);
      }
      revenue_sum = revenue_num + revenue;
      document.getElementById( "price-sum" ).innerHTML = revenue_sum.toLocaleString();
      price(revenue_sum);
    })
    checkbox[1].addEventListener('change', function(){
      if (checkbox[1].checked){
        console.log(18000);
        revenue += parseInt(8000);
      }else{
        console.log(0);
        revenue -= parseInt(8000);
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