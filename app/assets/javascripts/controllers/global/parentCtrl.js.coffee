angular.module('DispatcherApp').controller "ParentCtrl", ($scope, $rootScope, $timeout, $window, $filter, $http) ->

  $scope.serverErrorHandler = (error) ->
    message = null
    try
      message = error.data.error
    message ||= "There was a server error, please reload the page and try again."

    $scope.flashError(message)

    # HTTP 401 Unauthorized
    $window.location.reload() if error?.status == 401

  $scope.flashError = (message, permanent = false) ->
    type = if permanent then 'app.alert.permanent' else 'app.alert'
    $rootScope.$broadcast(type, 'danger', message)

  $scope.flashInfo = (message, permanent = false) ->
    type = if permanent then 'app.alert.permanent' else 'app.alert'
    $rootScope.$broadcast(type, 'info', message)