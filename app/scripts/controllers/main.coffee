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

  .controller 'ContactCtrl', ($scope, $modal) ->
    $scope.openContactModal = (e) ->
      modalInstance = $modal.open
        templateUrl: 'getContactModal.html'
        controller:  'CodeModalCtrl'
        resolve:
          code: ->
            return $scope.code
    return

  .controller 'ContactFormCtrl', ($scope, $http) ->
    $scope.result = 'hidden'
    $scope.resultMessage  
    $scope.formData
    $scope.submitButtonDisabled = false
    $scope.submitted = false

    $scope.submit = ->
      $http({
        method  : 'POST'
        url     : 'email/sendMail.php'
        data    : $scope.contact
        header  : { 'Content-Type': 'application/x-www-form-urlencoded' }
      }).success((data)->
        if data.success
          $scope.submitButtonDisabled = true
          $scope.resultMessage = data.message
          $scope.result = 'bg-success'
          contactForm.reset()
          return
        else
          $scope.submitButtonDisabled = false
          $scope.resultMessage = data.message
          $scope.result = 'bg-danger'
          return
      )
      return
    return

      

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