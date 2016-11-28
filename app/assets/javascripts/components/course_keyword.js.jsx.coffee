{button, span, br} = React.DOM

class @CourseKeyword extends React.Component
  constructor: (props) ->
    super props

  handleClick: (event) ->

  handleAjax: ->

  render: ->
    Tooltip = React.createFactory(window.ReactTooltip)
    span {},
      button {
        className: 'btn btn-science-tag btn-default btn-science-tag-public',
        onClick: ((e) => @handleClick(e)),
        'data-tip': 'Some text here...'
      }, @props.item
      Tooltip {},
