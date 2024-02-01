require "sinatra"
require "sinatra/reloader"
require "json"
require "http"

def get_color_palette
  var url = "http://colormind.io/api/";
  var data = {
    model : "default",
    input : [[44,43,44],[90,83,82],"N","N","N"]
  }
  
  var http = new XMLHttpRequest();
  
  http.onreadystatechange = function() {
    if(http.readyState == 4 && http.status == 200) {
      var palette = JSON.parse(http.responseText).result;
    }
  }
  
  http.open("POST", url, true);
  http.send(JSON.stringify(data));

end

get("/") do
  erb(:homepage)
end

get("/color-palette") do
  @new_palette=get_color_palette
  erb(:palette_gen)
end
