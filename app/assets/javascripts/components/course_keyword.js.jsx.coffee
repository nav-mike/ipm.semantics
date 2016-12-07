{span, h2, button, div} = React.DOM

class @CourseKeyword extends React.Component
  constructor: (props) ->
    super props
    @handleAjax()
    @state =
      modalIsOpen: false

  componentWillMount: ->
    window.ReactModal.setAppElement('body')

  openModal: ->
    @setState(modalIsOpen: true)
  
  afterOpenModal: (_event) ->
  
  closeModal: (_event) ->
    @setState(modalIsOpen: false)

  handleAjax: ->
    axios.get('/api/v1/courses/keyword',{
    params: {
        keyword: @props.item
      }
    })
    .then((response) => console.log(response))
    .catch((response) => console.log(response))

  render: ->
    Modal = React.createFactory(window.ReactModal)
    text = 'Data Mining (рус. добыча данных, интеллектуальный анализ данных, глубинный анализ данных) — собирательное название, используемое для обозначения совокупности методов обнаружения в данных ранее неизвестных, нетривиальных, практически полезных и доступных интерпретации знаний, необходимых для принятия решений в различных сферах человеческой деятельности.'
    span {},
      span {
        className: 'btn btn-science-tag btn-default btn-science-tag-public btn-xs',
        title: text,
        onClick: ((e) => @openModal(e))
      }, @props.item
      Modal {
        isOpen: @state.modalIsOpen,
        onAfterOpen: ((e) => @afterOpenModal(e)),
      },
        h2 {}, "Hello"
        button { onClick: ((e) => @closeModal(e)) }, "close"
        div {}, "I am a modal"
