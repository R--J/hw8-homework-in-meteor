ongoing = []

archived = []

classify-assignment = !->
  assignment-list = Assignments.find!.fetch!
  for item in assignment-list
    if moment(item.due, 'YY/M/D HH:mm').isAfter moment! then ongoing[*] = item
    else archived[*] = item

classify-assignment!

Template.assignment.helpers {
  ongoing: ongoing.reverse!
  archived: archived.reverse!
}

new-assignment-button = 
  initialize: !->
    $('#new-assignment-button')[0].onclick = !->
      $('#assignment-topic').val ''
      $('#assignment-requirement').val ''
      $('#assignment-due').val ''

modify-assignment-button = 
  initialize: !->
    for let button in $('.assignment-modify')
      button.onclick = !->
        topic = $(@).parent!.next!.children('.assignment-topic').text!
        for item in ongoing when item.topic is topic
          $('#assignment-topic').val item.topic
          $('#assignment-requirement').val item.requirement
          $('#assignment-due').val item.due
          break

window.onload = !->
  new-assignment-button.initialize!
  modify-assignment-button.initialize!