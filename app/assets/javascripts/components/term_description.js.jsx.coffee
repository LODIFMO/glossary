{div, button, textarea, form, input} = React.DOM

class @TermDescription extends React.Component
  constructor: (props) ->
    super props
    @state =
      selected: -1
      description: ''
  
  descriptionClick: (item, key) ->
    @setState(selected: key, description: item)
  
  handleChange: (event) ->
    @descriptionClick event.target.value, -1

  render: ->
    DescriptionItem = React.createFactory window.DescriptionItem
    descriptions = @props.descriptions
    div {},
      descriptions.map((item, index) =>
        DescriptionItem key: index, index: index, item: item, isSelected: index is @state.selected, parent: @
      )
      div { className: "panel panel-default panel-cursor" },
        div { className: "panel-body" },
          textarea { className: "form-control in-panel", onChange: ((e) => @handleChange(e)) },
      div { className: "form-group" },
        form { action: "/terms/#{@props.term.id}", method: 'POST', acceptCharset: 'UTF-8' },
          input { type: 'hidden', value: @state.description, name: 'term[description]' }
          input { type: 'hidden', value: @props.authenticity_token, name: 'authenticity_token' }
          input { type: 'hidden', value: 'put', name: '_method' }
          button { className: "btn btn-success", type: 'submit' }, 'Add description'
