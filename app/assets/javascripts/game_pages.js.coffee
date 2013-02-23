# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $ ".active"
  linkClicked = (e) ->
    alert $(e.currentTarget).attr("src")

  
  # alert('link clicked');
  $("iframe#wiki-iframe").load linkClicked
