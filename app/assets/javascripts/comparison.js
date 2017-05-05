window.ToolsStore = window.ToolsStore || { ids: [] }

$(function(){
  $(".product .mdl-menu").on('click', '.js-add-id', function(e) {
    console.log("adding")
    addId( $(this).data('id') )
    console.log(ToolsStore.ids)
  })
});

function setStore() {
  localStorage.setItem("ToolsStore", JSON.stringify(window.ToolsStore))
}

function addId(id) {
  window.ToolsStore.ids.push(id)
  window.ToolsStore.ids = uniqueArray( ToolsStore.ids );
  setStore();
}
function removeId(id) {
  window.ToolsStore.ids = ToolsStore.ids.filter(function(item) {
    return item != id
  })
  setStore();
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
