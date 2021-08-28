function PrintPopUp(ww,wh,URL) {
window.open(URL, 'adrespopup', 'toolbar=1,scrollbars=1,location=0,statusbar=1,menubar=1,resizable=1,width='+ww+',height='+wh+',left = 100,top = 50');
}

function setCellClass(cellId, newClass) 
  { 
    cellId.className=newClass;
  }

function navigateWindow(windowId, newURL) 
  { 
    windowId.location = newURL; 
  }

function popUp(ww,wh,URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=1,menubar=0,resizable=1,width='+ww+',height='+wh+',left = 100,top = 50');");
}



