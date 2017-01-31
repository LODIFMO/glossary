{div} = React.DOM

class @DescriptionItem extends React.Component
  constructor: (props) ->
    super props

  handleClick: (e) ->
    @props.doClick @props.item

  render: ->
    div { className: 'panel panel-default panel-cursor', onClick: ((e) => @handleClick(e)) },
      div { className: 'panel-body' }, @props.item
