{div, h1, a, li, ul, h1, i, img, table, tbody, thead, th, tr} = React.DOM

class @KeywordShow extends React.Component
  constructor: (props) ->
    super props

  render: ->
    OpenUniversityDataItem = React.createFactory(window.OpenUniversityDataItem)
    div {className: 'container'},
      div {className: 'page-header'},
        h1 {}, @props.keyword
      div {},
        ul {className: 'nav nav-tabs', role: 'tablist'},
          li {className: 'active', role: 'presentation'},
            a {href: '#dbpedia', 'aria-controls': 'html', role: 'tab', 'data-toggle': 'tab' },
              i {className: 'fa fa-fw fa-wikipedia-w'}
              ' DBpedia'
          li {role: 'presentation'},
            a {href: '#ou', 'aria-controls': 'html', role: 'tab', 'data-toggle': 'tab' },
              img {src: @props.ou_png}
              ' Open University'
          li {role: 'presentation'},
            a {href: '#southampton', 'aria-controls': 'html', role: 'tab', 'data-toggle': 'tab' },
              img {src: @props.southampton_png, height: 20, width: 20}
              ' University of Southampton'
      div {className: 'tab-content'},
        div {className: 'tab-pane active', id: 'dbpedia', role: 'tabpanel'},
          div {className: 'well well-lg'}, 'DBpedia'
        div {className: 'tab-pane', id: 'ou', role: 'tabpanel'},
          div {className: 'panel panel-warning'},
            div {className: 'panel-heading'}, 'Data'
            div {className: 'panel-body'},
              @props.ou_data.map((item, index) =>
                OpenUniversityDataItem item: item, key: index
              )
          div {className: 'panel panel-info'},
            div {className: 'panel-heading'}, 'Publications'
            div {className: 'panel-body'},
              @props.ou_a_data.map((item, index) =>
                OpenUniversityDataItem item: item, key: index
              )
        div {className: 'tab-pane', id: 'southampton', role: 'tabpanel'},
          div {className: 'panel panel-warning'},
            div {className: 'panel-heading'}, 'Data'
            div {className: 'panel-body'},
              @props.s_data.map((item, index) =>
                OpenUniversityDataItem item: item, key: index
              )
          div {className: 'panel panel-info'},
            div {className: 'panel-heading'}, 'Publications'
            div {className: 'panel-body'},
              @props.s_a_data.map((item, index) =>
                OpenUniversityDataItem item: item, key: index
              )
