# http://weather.livedoor.com/forecast/rss/primary_area.xml
#  から地方のidを取得する

$ = require('jquery')

$.ajax
  async: true
  cache: false
  type: 'GET'
  url: 'http://weather.livedoor.com/forecast/rss/primary_area.xml'
  dataType: 'xml'
  error: ->
    alert('Error loading XML document')
  success: (xml) ->
    areaList = []
    $(xml).find('city').each　(i) ->
      title = $(@).attr('title')
      id = $(@).attr('id')
      areaList.push({area: title, id: id})
      console.log(id)
    vue = new Vue
      el: '#app'
      data:
        hello: 'hello, world'
        areaList: areaList

getWeatherIn = (id) ->
  $.ajax
    async: true
    cache: false
    type: 'GET'
    data: 'city=' + id
    url: 'http://weather.livedoor.com/forecast/webservice/json/v1'
    dataType: 'json'
    error: ->
      alert('Error loading Weather JSON document')
    success: (json) ->
      alert(json)
