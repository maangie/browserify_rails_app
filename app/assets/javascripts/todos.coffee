# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

require 'ydn.db'

DB_NAME = 'todo-db'
STORE_NAME = 'todo-store'

db = new ydn.db.Storage(
  DB_NAME,
  { stores: [{ name: STORE_NAME, keyPath: 'id', autoIncrement: true }] }
)

$(document).on 'click', '#submit', ->
  return unless $('#new_todo').validationEngine('validate')

  title   = $('#todo_title').val()
  content = $('#todo_content').val()

  date = new Date(
    $('#todo_todo_date_1i').val(), $('#todo_todo_date_2i').val() - 1,
    $('#todo_todo_date_3i').val(), $('#todo_todo_date_4i').val(),
    $('#todo_todo_date_5i').val()
  )

  todo = { title: title, content: content, date: date.valueOf() }
  db.remove STORE_NAME, id if id = getTodoId()
  db.add(STORE_NAME, todo).done (key) ->
    location.href = "/todos/#{key}"

$('document').ready ->
  indexInit() if $('.todos.index').length
  showInit()  if $('.todos.show').length
  editInit()  if $('.todos.edit').length

indexInit = () ->
  db.count(STORE_NAME).done (c) ->
    iter = new ydn.db.ValueIterator(STORE_NAME)
    db.valuesOf(iter, c).done (values) ->
      for v in values
        tr = $('<tr/>').attr('id', "todo-#{v.id}")

        show_link = $('<a/>').text(v.title).attr('href', "/todos/#{v.id}")
        $('<td/>').append(show_link).appendTo(tr)

        $('<td/>').text(v.content).appendTo(tr)

        $('<td/>').text(getLocaleDateTimeString(v.date)).appendTo(tr)

        edit_link =
          $('<a/>').addClass('btn btn-default btn-xs')
                   .text('編集')
                   .attr('href', "/todos/#{v.id}/edit")

        delete_link =
          $('<a/>').addClass('btn btn-xs btn-danger')
                   .text('削除')
                   .attr('href', '#')
                   .attr('data-id', v.id)
                   .click ->
                     if deleteTodo $(@).attr('data-id')
                       $("#todo-#{id}").fadeOut()

        $('<td/>').append(edit_link).append(delete_link).appendTo tr

        $('#todo_rows').append tr

showInit = () ->
  db.get(STORE_NAME, getTodoId()).done (v) ->
    $('#title').text v.title
    $('#content').text v.content
    $('#date').text getLocaleDateTimeString(v.date)

editInit = () ->
  db.get(STORE_NAME, getTodoId()).done (v) ->
    $('#todo_title').val(v.title)
    $('#todo_content').val(v.content)

    d = new Date(v.date)
    $('#todo_todo_date_1i').val d.getFullYear()
    $('#todo_todo_date_2i').val d.getMonth() + 1
    $('#todo_todo_date_3i').val d.getDate()
    $('#todo_todo_date_4i').val get2DigitNumber d.getHours()
    $('#todo_todo_date_5i').val get2DigitNumber d.getMinutes()

deleteTodo = (id)
  return false unless confirm('よろしいですか？')
  db.remove STORE_NAME, id

getTodoId = () -> parseInt($('#todo_id').text())

getLocaleDateTimeString = (dateValue) ->
  d = new Date(dateValue)
  "#{d.toLocaleDateString()} #{d.toLocaleTimeString()}"

get2DigitNumber = (n) -> ('0' + n).slice(-2)
