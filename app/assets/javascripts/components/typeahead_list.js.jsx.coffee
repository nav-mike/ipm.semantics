{div, span} = React.DOM

class @TypeaheadList extends React.Component
  handleOnClick: (item, event) =>
    @props.onOptionSelected(item, event)

  render: ->
    TypeaheadListItem = React.createFactory(window.TypeaheadListItem)
    div className: 'panel panel-default',
      div className: 'panel-body',
        @props.options.map((item , index) =>
          TypeaheadListItem item: item, key: index, handleClick: @handleOnClick
        )
