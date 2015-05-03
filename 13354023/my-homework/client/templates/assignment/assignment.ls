test-assignment = [
  {
    topic: 'Homework 1',
    Requirement: 'Finish Chapter 1',
    Due: '15/5/1 09:00'
  },
  {
    topic: 'Homework 2',
    Requirement: 'Finish Chapter 2',
    Due: '15/5/2 09:00'
  },
  {
    topic: 'Homework 3',
    Requirement: 'Finish Chapter 3',
    Due: '15/5/3 09:00'
  },
  {
    topic: 'Homework 4',
    Requirement: 'Finish Chapter 4',
    Due: '15/5/4 09:00'
  },
  {
    topic: 'Homework 5',
    Requirement: 'Finish Chapter 5',
    Due: '15/5/5 09:00'
  }
]

Template.assignment.helpers {
  ongoing: test-assignment
  archived: test-assignment
}