{button} = React.DOM

TypeaheadButton = React.createClass
  onClick: ->
    @props.handleClick(@props.name)

  render: ->
    button className: 'btn btn-xs btn-default', onClick: @onClick, @props.name