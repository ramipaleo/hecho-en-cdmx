'use strict'

angular.module('cdmxApp')
  .controller 'MainCtrl', ($scope, $modal, $interval) ->
    $scope.code = {}

    $scope.init = ->
      item = angular.element(".fullscreen-img")
      totalItems = item.length
      index = angular.element(".opaque")
      current = null

      $interval ->
        if current == totalItems
          item.eq(0).addClass("opaque")
          item.eq(totalItems).removeClass("opaque")
          current = 0
          return
        else
          item.eq(current-1).removeClass("opaque")
          item.eq(current).addClass("opaque")
          current += 1
          return
      , 8000

      return

    # Grab the $event (as 'e') from the click handler as well
    $scope.openCodeModal = (e) ->
      isText = !$(e.target).is 'img'

      if isText is true
        $scope.code.isText = true
      else
        $scope.code.isText = false
        $scope.code.badgeURL = $(e.target).attr 'src'

      modalInstance = $modal.open
        templateUrl:  'getCodeModal.html'
        controller:   'CodeModalCtrl'
        resolve:
          code: ->
            return $scope.code





angular.module('cdmxApp')
  .controller 'CodeModalCtrl', ($scope, $modalInstance, code) ->
    $scope.code = code
    $scope.closeCodeModal = ->
      $modalInstance.dismiss 'cancel'

    $scope.copyText = 'Copiar código'
    $scope.copied = false

    # Zeroclipboard thing
    $scope.getTextToCopy = ->
      $('.form-control.active').val()

    $scope.doAfterCopy = ->
      $scope.copyText = '¡Copiado!'
      $scope.copied = true
