window.ToolsStore = JSON.parse( localStorage.getItem('ToolsStore') ) || { ids: [] }

$(function(){
  checkCompareButton();

  $("body.spree-taxons").on('click', '.js-add-id', function(e) {
    addId( $(this).data('id') )
  })

  $("body.spree-taxons").on('click', '.js-remove-id', function(e) {
    removeId( $(this).data('id') )
  })

  $("body.compare").on('click', '.js-compare-clear', function(e) {
    window.ToolsStore.ids = []
    setStore();
  })

  $("body.compare").on('click', '.js-remove-from-comparison', function(e) {
    removeFromComparison( $(this).data('id') )
  })

  $("body.compare").on('click', '.js-compare-refresh', function(e) {
    window.location = "/compare?" + $.param({ids: window.ToolsStore.ids})
  })

});

function checkCompareButton() {
  if(window.ToolsStore.ids.length) {
    $("#compare-link").show("slide");
    $("#compare-link").attr("href", "/compare?locale=" + Spree.url_params.locale + "&" + $.param({ids: window.ToolsStore.ids}))
  } else {
    $("#compare-link").hide("slide");
  }
}

function addId(id) {
  window.ToolsStore.ids.push(id)
  window.ToolsStore.ids = uniqueArray( ToolsStore.ids );
  changeLink('add', id, "Удалить из сравнения");
  checkCompareButton();
  setStore();
}

function removeId(id) {
  window.ToolsStore.ids = ToolsStore.ids.filter(function(item) {
    return item != id
  })
  changeLink('remove', id, "Добавить в сравнениe");
  checkCompareButton();
  setStore();
}

function removeFromComparison(id) {
  window.ToolsStore.ids = ToolsStore.ids.filter(function(item) {
    return item != id
  })
  setStore();
  window.location = "/compare?" + $.param({ids: window.ToolsStore.ids})
}

function changeLink(type, id, text) {
  var li = $('.js-'+ type +'-id[data-id=' + id + ']')
  li.text(text)
  li.toggleClass("js-add-id")
  li.toggleClass("js-remove-id")
  li = undefined;
}

function setStore() {
  localStorage.setItem("ToolsStore", JSON.stringify(window.ToolsStore))
}

function uniqueArray(arr) {
    var a = [];
    for (var i=0, l=arr.length; i<l; i++)
        if (a.indexOf(arr[i]) === -1 && arr[i] !== '')
            a.push(arr[i]);
    return a;
}
