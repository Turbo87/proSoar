function loadjsfile(filename){
 var fileref=document.createElement('script')
 fileref.setAttribute("type","text/javascript")
 fileref.setAttribute("src", filename)
 
 if (typeof fileref!="undefined")
  document.getElementsByTagName("head")[0].appendChild(fileref)
}

loadjsfile("http://maps.google.com/maps/api/js?v=3.7&amp;sensor=false");
