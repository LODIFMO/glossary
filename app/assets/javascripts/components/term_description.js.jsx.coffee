{div, button, textarea, form, input} = React.DOM

class @TermDescription extends React.Component
  constructor: (props) ->
    super props
  
  descriptionClick: (item) ->
    console.log item

  render: ->
    DescriptionItem = React.createFactory window.DescriptionItem
    descriptions = @props.descriptions
    div {},
      descriptions.map((item, index) =>
        DescriptionItem key: index, item: item, doClick: @descriptionClick
      )
      div { className: "panel panel-default panel-cursor" },
        div { className: "panel-body" },
          textarea { className: "form-control in-panel" },
      div { className: "form-group" },
        form { action: "/terms/#{@props.term.id}", method: 'POST', acceptCharset: 'UTF-8' },
          input { type: 'hidden', value: 'some description here...', name: 'term[description]' }
          input { type: 'hidden', value: @props.authenticity_token, name: 'authenticity_token' }
          input { type: 'hidden', value: 'put', name: '_method' }
          button { className: "btn btn-success", type: 'submit' }, 'Add description'
