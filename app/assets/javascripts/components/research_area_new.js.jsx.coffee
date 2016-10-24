{div, form, button, input, label} = React.DOM

class @ResearchAreaNew extends React.Component
  render: ->
    div {},
      form {},
        div className: 'form-group',
        div className: 'form-group',
          label htmlFor: 'research_area_uri', 'URI:'
          input className: 'form-control', id: 'research_area_uri', name: 'research_area[name]',
        div className: 'form-group',
          button type: 'submit', className: 'btn btn-success', 'Добавить'
