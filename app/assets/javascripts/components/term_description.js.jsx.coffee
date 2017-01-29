{div, button, textarea} = React.DOM

class @TermDescription extends React.Component
  constructor: (props) ->
    super props

  render: ->
    DescriptionItem = window.DescriptionItem
    div {},
      div { className: "panel panel-default panel-cursor" },
        div { className: "panel-body" }, 'Ut faucibus convallis sem, at rutrum lectus auctor vitae. Ut sagittis, lectus sit amet faucibus malesuada, massa lectus vehicula eros, et maximus risus eros id magna. Donec accumsan tempus molestie. Nunc vel augue sollicitudin, fringilla augue sed, ultrices nunc. In blandit sed arcu sed mattis. Pellentesque iaculis purus eget porta mollis. Vestibulum tincidunt enim sit amet odio dictum posuere. Duis nisi lacus, congue sed nisi sit amet, bibendum sagittis orci. Nam felis ipsum, congue eu gravida vitae, volutpat non libero.'
      div { className: "panel panel-default panel-cursor" },
        div { className: "panel-body" }, 'Ut viverra ultricies scelerisque. In ut felis egestas, euismod ipsum in, elementum odio. Maecenas at orci vitae mi commodo varius sed eget nibh. Proin vel faucibus mauris. Mauris purus est, consequat at erat et, consequat molestie elit. Sed eget lacus ut est elementum pharetra ac et sem. In neque orci, tempus ac ultricies a, posuere sit amet quam. Mauris consectetur auctor imperdiet. Proin blandit at augue id aliquet. Integer id finibus libero. Integer placerat risus eu interdum luctus. Maecenas non blandit nulla. Quisque congue a turpis ac efficitur. Quisque aliquet sodales magna vulputate pellentesque. Vivamus faucibus, neque a convallis venenatis, mi dui iaculis ante, et laoreet ante leo eget sem. Aliquam tincidunt odio ut erat luctus fringilla.'
      div { className: "panel panel-danger panel-select panel-cursor" },
        div { className: "panel-body" }, 'Donec malesuada molestie auctor. Nunc vestibulum nisl vitae pretium aliquam. Curabitur non fermentum dolor. Aenean vehicula lobortis massa, ut rutrum diam ullamcorper eu. Sed a diam quis ex porttitor tempor. Phasellus cursus fringilla interdum. Pellentesque mauris libero, faucibus vel rhoncus quis, vestibulum in felis. Fusce nec tincidunt magna, vitae mollis eros.'
      div { className: "panel panel-default panel-cursor" },
        div { className: "panel-body" },
          textarea { className: "form-control in-panel" },
      div { className: "form-group" },
        button { className: "btn btn-success" }, 'Add description'
