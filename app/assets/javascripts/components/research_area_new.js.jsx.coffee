{div, form, button, input, label} = React.DOM

class @ResearchAreaNew extends React.Component
  render: ->
    Typeahead = React.createFactory(window.ReactTypeahead.Typeahead)
    typeaheadClasses = {
      input: 'form-control'
    }
    div {},
      form {},
        div className: 'form-group',
          label {}, 'Научное направление:'
          Typeahead customClasses: typeaheadClasses, options: ['John', 'Paul', 'George', 'Ringo'], maxVisible: 2, customListComponent: window.TypeaheadList,
        div className: 'form-group',
          label htmlFor: 'research_area_uri', 'URI:'
          input className: 'form-control', id: 'research_area_uri', name: 'research_area[name]',
        div className: 'form-group',
          button type: 'submit', className: 'btn btn-success', 'Добавить'
