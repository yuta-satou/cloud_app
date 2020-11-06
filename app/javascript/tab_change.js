
if (document.URL.match( /items/ )){
  document.addEventListener('DOMContentLoaded', function(){
    // タブに対してクリックイベントを適用
    const tabs = document.getElementsByClassName('tab'); //ノードを取得
    for(let i = 0; i < tabs.length; i++) { //繰返し構文で全てに適用
        tabs[i].addEventListener('click', tabSwitch);
    }

    // タブをクリックすると実行する関数
    function tabSwitch(){
        // タブのclassの値を変更
        document.getElementsByClassName('is-active')[0].classList.remove('is-active'); //is-activeの追加
        this.classList.add('is-active'); //is-activeの削除
        // コンテンツのclassの値を変更
        document.getElementsByClassName('is-show')[0].classList.remove('is-show');
        const arrayTabs = Array.prototype.slice.call(tabs); //引数にとったオブジェクトを配列に変換してくれます。
        const index = arrayTabs.indexOf(this); //配列に対してだけ使い、DOMを引数にとって一致した要素番号を戻します。
        document.getElementsByClassName('panel')[index].classList.add('is-show');
    };
  });
}