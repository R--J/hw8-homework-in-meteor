Meteor.startup ->
  $('#assignment-due').datetimepicker({
    format: 'YY/M/D HH:mm'
    minDate: moment()
  })