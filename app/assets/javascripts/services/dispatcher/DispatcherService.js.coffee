angular.module('DispatcherApp').factory 'Dispatcher', ($resource, $http) ->
  class Dispatcher
    constructor: (errorHandler) ->
      @service = $resource('/api/planes/:id/:action',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    all: (params, cb = null) ->
      @service.query(params, ((planes) -> cb?(planes)), @errorHandler)

    takeOff: (params, cb = null) ->
      new @service(params).$save {id: params.plane_id, action: 'take_off'}, ((plane) -> cb?(plane)), @errorHandler

    ajax_status: (plane_ids, cb = null) ->
      new @service({id: 'ajax_status', planes: plane_ids}).$save ((res) -> cb?(res)), (() -> cb?())

