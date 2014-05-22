'use strict'

angular.module('cdmxApp')
  .controller 'MainCtrl', ($scope, $modal) ->
    $scope.code = {}

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
