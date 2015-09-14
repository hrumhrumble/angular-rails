angular.module('Course').controller 'CourseManagerCtrl', ($http, $scope, Restangular) ->
  $scope.courses = Restangular.all('courses')
  $scope.message = 'Hover Me!'

  $scope.courses.getList().then (accounts) ->
    $scope.allAccounts = accounts

  $scope.addCourse = ->
    if $scope.courseTitle
      $scope.courses.post(name: $scope.courseTitle, passed: false).then (data) ->
        $scope.allAccounts.push(data)
        $scope.courseTitle = null
    else
      alert "Can't add course"

  $scope.updateCourse = (course, index) ->
    Restangular.one('courses', course.id).get().then (data) ->
      $scope.cs = data
      $scope.cs.passed = course.passed
      $scope.cs.put()

  $scope.editCourse = (course, index) ->
    course.editing = true
    course.submit = ->
      course.editing = false
      Restangular.one('courses', course.id).get().then (data) ->
        console.log $scope.cs = data
        $scope.cs.name = course.name
        $scope.cs.put()

  $scope.deleteCourse = (course, index) ->
    can_delete = confirm("Are you shure?")
    if can_delete
      Restangular.one('courses', course.id).remove().then (data) ->
        $scope.allAccounts.splice(index, 1)

  $scope.setDescription = (passed) ->
    if passed then 'Pass' else 'Not Pass'