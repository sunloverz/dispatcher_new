#= require_self
#= require_tree ./services/dispatcher
#= require_tree ./controllers/global
#= require_tree ./controllers/dispatcher

DispatcherApp = angular.module('DispatcherApp', ['ngResource', 'ngRoute'])
