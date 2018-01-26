ready = ->
  new Typed '.element',
    strings: [
      "Hello and welcome to my page.",
      "I'm Wojciech Winnicki and I'm a Ruby On Rails Developer"
    ],
    typeSpeed: 50,
    backSpeed: 20,
    cursorChar: '_',
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
