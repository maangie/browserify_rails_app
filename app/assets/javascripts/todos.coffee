# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

require 'ydn.db'

db = new ydn.db.Storage('db-name');
db.put('store-name', {message: 'Hello world!'}, 'id1');
db.get('store-name', 'id1').always((record) -> console.log(record))

db.count('store-name').done (x) ->
  console.log x

# console.log db.count('store-name')


# db.from('store-name').list(10).done (objs) ->
#  console.log(objs)

$(document).on 'click', '#submit', ->
  return unless $('#new_todo').validationEngine('validate')

  title   = $('#todo_title').val()
  content = $('#todo_content').val()

  date = new Date(
    $('#todo_todo_date_1i').val(), $('#todo_todo_date_2i').val(),
    $('#todo_todo_date_3i').val(), $('#todo_todo_date_4i').val(),
    $('#todo_todo_date_5i').val()
  )

  console.log title
  console.log content
  console.log date

  db.put('store-name', { title: title, content: content, date: date.valueOf() }, 1)
