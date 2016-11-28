{div, h1, button, p} = React.DOM

class @CoursesShow extends React.Component
  constructor: (props) ->
    super props
    @state =
      keywords: ['data mining', 'semantic web']

  render: ->
    div {className: 'container'},
      div {className: 'page-header'},
        h1 {}, @props.title
      div {className: 'panel panel-default'},
        div {className: 'panel-heading'}, 'Описание'
        div {className: 'panel-body'},
          div {dangerouslySetInnerHTML: {__html: @props.description}},
      div {className: 'panel panel-default'},
        div {className: 'panel-heading'}, 'Ключевые термины'
        div {className: 'panel-body'},
          p {},
            @state.keywords.map((item, index) =>
              button {key: index, className: 'btn btn-science-tag btn-default btn-science-tag-public'}, item
            )
          
