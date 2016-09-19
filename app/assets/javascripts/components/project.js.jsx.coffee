class @Project extends React.Component
  @propTypes =
    id: React.PropTypes.number
    title: React.PropTypes.string
    description: React.PropTypes.string

  render: ->
    `<div>
      <div>Id: {this.props.id}</div>
      <div>Title: {this.props.title}</div>
      <div>Description: {this.props.description}</div>
    </div>`
