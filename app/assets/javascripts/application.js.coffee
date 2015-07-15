#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->

  Course = angular.module('Course', ['restangular']).config (RestangularProvider)->
    RestangularProvider.setBaseUrl('/api')

  Course.controller 'CourseManagerCtrl', ($http, $scope, Restangular) ->
    $scope.courses = Restangular.all('courses')

    $scope.courses.getList().then (accounts) ->
      $scope.allAccounts = accounts

    $scope.addCourse = ->
      if $scope.courseTitle
        $scope.courses.post(name: $scope.courseTitle, passed: false).then (data) ->
          $scope.allAccounts.push(data)
      else
        alert 'Невозможно добавить курс'

    $scope.updateCourse = (course, index) ->
      Restangular.one('courses', course.id).get().then (data) ->
        $scope.cs = data
        $scope.cs.passed = course.passed
        $scope.cs.put()

    $scope.deleteCourse = (course, index) ->
      Restangular.one('courses', course.id).remove().then (data) ->
        $scope.allAccounts.splice(index, 1)

    $scope.setDescription = (passed) ->
      if passed then 'Пройден' else 'Не пройден'