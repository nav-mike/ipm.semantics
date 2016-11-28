{span} = React.DOM

class @CourseKeyword extends React.Component
  constructor: (props) ->
    super props
    @handleAjax()

  handleAjax: ->
    axios.get('/api/v1/courses/keyword',{
    params: {
        keyword: @props.item
      }
    })
    .then((response) => console.log(response))
    .catch((response) => console.log(response))

  render: ->
    Tooltip = React.createFactory(window.ReactTooltip)
    span {},
      span {
        className: 'btn btn-science-tag btn-default btn-science-tag-public',
        'data-tip': 'Some text here...'
      }, @props.item
      Tooltip {
        place: 'top',
        type: 'info',
        event: 'click'
      },
