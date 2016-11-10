{div, input, button, i, span} = React.DOM

class @CourseTag extends React.Component
  constructor: (props) ->
    super props
    @state =
      count: 0

  handleClick: (_event) ->
    count = @state.count
    @setState(count: count + 1)

  render: ->
    div className: 'panel panel-danger',
      div className: 'panel-heading',
        span {}, 'Ключевые термины (experimental feature)'
        i className: 'fa fa-fw fa-exclamation'
        i className: 'fa fa-fw fa-exclamation'
      div className: 'panel-body',
        div className: 'container',
          div className: 'row',
            div className: 'col-md-2',
              input className: 'form-control', placeholder: 'Термин (rus/eng)',
            div className: 'col-md-2',
              button {
                type: 'button',
                className: 'btn btn-default btn-xs',
                onClick: ((e) => @handleClick(e))
              },
                i className: 'fa fa-fw fa-plus',
