angular.module('Course', ['restangular']).config (RestangularProvider) ->
  RestangularProvider.setBaseUrl('/api')