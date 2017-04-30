angular.module('DispatcherApp').controller "DispatcherIndexCtrl", ($scope, $controller, $rootScope, $timeout, $location, $interval, Dispatcher) ->
  $controller('ParentCtrl', {$scope: $scope})
  $scope.WAITING_STATUS = 'waiting'

  $scope.statusTimer = null
  $scope.myFilter = {}

  $scope.init = ->
    @dispatcherService = new Dispatcher($scope.serverErrorHandler)
    $scope.fetchPlanes()

  $scope.fetchPlanes = ->
    @dispatcherService.all {}, (planes) ->
      $scope.planes = planes
      $scope.startUpdatingStatuses()

  $scope.takeOff = (item, index) ->
    @dispatcherService.takeOff {plane_id: item.id}, (plane) ->
      $scope.planes[index].status = plane.status

  $scope.startUpdatingStatuses = ->
    unless angular.isObject($scope.statusTimer)
      $scope.updatePlaneStatuses()
      $scope.statusTimer = $interval($scope.updatePlaneStatuses, 10000)

  $scope.cancelUpdatingStatuses = () ->
    if angular.isObject($scope.statusTimer)
      $interval.cancel($scope.statusTimer)
      $scope.statusTimer = null

  $scope.updatePlaneStatuses = ->
    plane_ids = []
    angular.forEach $scope.planes, (plane) ->
      if plane.status == $scope.WAITING_STATUS
        plane_ids.push(plane.id)

    if plane_ids.length == 0
      $scope.cancelUpdatingStatuses()
      return true

    $scope.dispatcherService.ajax_status plane_ids, (res) ->
      newPlanes = res['planes']

      angular.forEach $scope.planes, (plane) ->
        angular.forEach newPlanes, (newPlane) ->
          if plane.id == newPlane.id and newPlane.status != $scope.WAITING_STATUS
            plane.status = newPlane.status
            angular.forEach newPlane.histories, (history) ->
              plane.histories.push(angular.copy(history))
#            plane.histories = angular.copy(newPlane.histories)


  $scope.init()