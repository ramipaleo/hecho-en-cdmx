'use strict'

angular.module('cdmxApp')
  .controller 'MainCtrl', ($scope, $modal, $interval, $rootScope) ->
    $scope.code = {}

    $rootScope.authors = [
      (name: 'Alex Torres', url: 'https://www.flickr.com/photos/psicoloco/11926669523/', title: 'México City @ Flickr'),
      (name: 'Ismael Villafranco', url: 'https://www.flickr.com/photos/maelvillafranco/7369702774/in/photostream/', title: 'Sanborns de los azulejos @ Flickr'),
      (name: 'Javier Samaniego', url: 'https://www.flickr.com/photos/38473755@N07/3636771245/', title: 'Angel De La Independencia @ Flickr'),
      (name: 'Wendy Carrillo', url: 'https://www.flickr.com/photos/29792566@N08/4997078921/', title: 'Mexico City Bicentennial @ Flickr'),
      (name: 'Esparta Palma', url: 'https://www.flickr.com/photos/esparta/404023488/', title: 'Palacio de Bellas Artes @ Flickr'),
      (name: 'Esparta Palma', url: 'https://www.flickr.com/photos/esparta/1533441890/',title: 'Luces de la Ciudad @ Flickr'),
    ]

    $scope.init = ->
      item = angular.element(".fullscreen-img")
      author = angular.element(".authorbg")
      totalItems = item.length
      #console.log totalItems
      current = 0
      $rootScope.authorItem = 0

      $interval ->
        current +=1
        $rootScope.authorItem = current

        if current == 1
          item.eq(0).removeClass("opaque")
          item.eq(1).addClass("opaque")
        else if current < totalItems
          item.eq(current).addClass("opaque")
          item.eq(current-1).removeClass("opaque")
        else if current == totalItems
          item.eq(0).addClass("opaque")
          item.eq(totalItems-1).removeClass("opaque")
          current = 0
          $rootScope.authorItem = 0
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
