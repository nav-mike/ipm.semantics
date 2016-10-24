{div, input, br} = React.DOM

nations = ['britain', 'ireland', 'norway', 'sweden', 'denmark', 'germany',
  'holland', 'belgium', 'france', 'spain', 'portugal', 'italy', 'switzerland']

Typeahead = React.createClass
  getInitialSatet: ->
    { input: '' }

  handleChnage: ->
    @setState input: @refs.field.getDOMNode().value

  handleClick: (ra) ->
    @setState input: ra

  matches: (input) ->
    regex = new RegExp(input, "i")
    ras = nations # @props.areas
    _.select ras, (ra) -> ra.match(regex) && ra != input

  render: ->
    div {},
      input ref: 'field', onChange: @handleChnage, value: @state.input
      br {}
      _.map @matches(@state.input), (ra) =>
        TypeaheadButton handleClick: @handleClick, name: ra
