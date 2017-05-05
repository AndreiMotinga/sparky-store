window.ToolsStore = JSON.parse( localStorage.getItem('ToolsStore') ) || { ids: [] }

$(function(){
  checkCompareButton();

  $("body.spree-taxons").on('click', '.js-add-id', function(e) {
    console.log("adding")
    addId( $(this).data('id') )
    console.log(ToolsStore.ids)
  })

  $("body.spree-taxons").on('click', '.js-remove-id', function(e) {
    console.log("removing")
    removeId( $(this).data('id') )
    console.log(ToolsStore.ids)
  })

  $("body.compare").on('click', '.js-remove-id', function(e) {
    console.log("removing")
    removeId( $(this).data('id') )
    console.log(ToolsStore.ids)
  })

  $("body.compare").on('click', '.js-compare-clear', function(e) {
    console.log("clearing")
    window.ToolsStore.ids = []
    setStore();
    console.log(ToolsStore.ids)
  })

});

function setStore() {
  localStorage.setItem("ToolsStore", JSON.stringify(window.ToolsStore))
}

function checkCompareButton() {
  if(window.ToolsStore.ids.length) {
    $(".js-compare-link").show("slide");
  } else {
    $(".js-compare-link").hide("slide");
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

function changeLink(type, id, text) {
  var li = $('.js-'+ type +'-id[data-id=' + id + ']')
  li.text(text)
  li.toggleClass("js-add-id")
  li.toggleClass("js-remove-id")
  li = undefined;
}

function uniqueArray(arr) {
    var a = [];
    for (var i=0, l=arr.length; i<l; i++)
        if (a.indexOf(arr[i]) === -1 && arr[i] !== '')
            a.push(arr[i]);
    return a;
}

// store_string = JSON.stringify(store)
// store = JSON.parse(store_string)
