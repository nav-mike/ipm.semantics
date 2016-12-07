{span, h2, button, div} = React.DOM

class @CourseKeyword extends React.Component
  constructor: (props) ->
    super props
    @handleAjax()
    @state =
      modalIsOpen: false
      text: ''

  handleAjax: ->
    axios.get('/api/v1/courses/keyword',{
    params: {
        keyword: @props.item
      }
    })
    .then((response) => @setState(text: response.data.description))
    .catch((response) => console.log(response))

  render: ->
    text = @state.text
    span {},
      span {
        className: 'btn btn-science-tag btn-default btn-science-tag-public btn-xs',
        title: text
      }, @props.item
