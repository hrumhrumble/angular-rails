angular.module('Course').directive 'tap', ->
  (scope, element, attr) ->
    element.on 'mouseenter', -> console.log scope.$apply attr['tap']
