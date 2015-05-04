Nav =
  initialize: !->
    Nav.titles = $('#nav li')
    for let title-id from 0 til Nav.titles.length
      Nav.titles[title-id].onclick = !->
        Nav.activate-title-and-its-area title-id
        Nav.disactivate-other-titles-and-their-area title-id
    $(Nav.titles[0]).trigger('click')

  activate-title-and-its-area: (id) !->
    $(Nav.titles[id]).addClass 'active'
    switch id
    case 0 then $('#assignment').show!
    case 1 then $('#submission').show!
    case 2 then $('#profile').show!

  disactivate-other-titles-and-their-area: (selected-id) !->
    for let id from 0 til Nav.titles.length when id isnt selected-id
      $(Nav.titles[id]).removeClass('active')
      switch id
      case 0 then $('#assignment').hide!
      case 1 then $('#submission').hide!
      case 2 then $('#profile').hide!

set-datetimepicker = !->
  $('#assignment-due').datetimepicker({
    format: 'YY/M/D HH:mm'
    minDate: moment()
  })

set-panel = !->
  headings = $('.panel-heading')
  for let heading in headings
    heading.onclick = !->
      contents = $(@).next!
      for content in contents
        if $(content).is ':visible'
          $(content).hide!
          $($(content).parent!).children('table').hide!
          $(@).children('.glyphicon-chevron-up').addClass('glyphicon-chevron-down')
          $(@).children('.glyphicon-chevron-up').removeClass('glyphicon-chevron-up')
        else 
          $(content).show!
          $($(content).parent!).children('table').show!
          $(@).children('.glyphicon-chevron-down').addClass('glyphicon-chevron-up')
          $(@).children('.glyphicon-chevron-down').removeClass('glyphicon-chevron-down')
    $(heading).trigger('click')



Meteor.startup ->
  set-datetimepicker!
  set-panel!
  Nav.initialize!