{dl, dt, dd, a} = React.DOM
class @OpenUniversityDataItem extends React.Component
  constructor: (props) ->
    super props

  render: ->
    dl {},
      dt {}, 'URI'
      dd {},
        a {href: @props.item.think}, @props.item.think
      dt {}, 'description'
      dd {}, @props.item.description
      dt {}, 'type'
      dd {},
        a {href: @props.item.type}, @props.item.type
      dt {}, 'label'
      dd {}, @props.item.label
      dt {}, 'URL'
      dd {},
        a {href: @props.item.url}, @props.item.url
      dt {}, 'title'
      dd {}, @props.item.title
