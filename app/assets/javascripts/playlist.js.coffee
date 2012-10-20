# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
    $('a[data-update-target]')
    .live "ajax:success", (evt, data) ->
        if data.votes == 0
         $('#song_row_' + data.id).remove();
        else 
         target = $(this).data('update-target');
         $('#' + target).html(data.votes);
