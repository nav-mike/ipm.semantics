{button} = React.DOM

class @CourseKeyword extends React.Component
  render: ->
    button {className: 'btn btn-science-tag btn-default btn-science-tag-public'}, @props.item
