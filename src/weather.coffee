# http://weather.livedoor.com/forecast/rss/primary_area.xml
#  から地方のidを取得する

$ = require('jquery')

vueArea = new Vue
  el: '.app'
  data:
    areaList: []
  methods:
    onClick: (item) ->
      console.log(item.area)
      getWeatherIn(item.id)

vueLocalWeather = new Vue
  el: '.local-weather'
  data:
    date: ''
    title: ''
    description: ''

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
    vueArea.areaList = areaList

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
      vue = vueLocalWeather
      vue.date = json.publicTime
      vue.title = json.title
      vue.description = json.description.text
