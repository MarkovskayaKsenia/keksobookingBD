'use strict';
(function(){
  var PIN_WIDTH = 50;
  var PIN_HEIGHT = 70;
  var MAX_PINS = 50;

  // Находим место для вставки пинов и шаблон
  var mapPins = document.querySelector('.map__pins');
  var map = document.querySelector('.map');
  var pinTemplate = document.querySelector('template').content.querySelector('.map__pin');
  var mapFiltersContainer = document.querySelector('.map__filters-container');

  // Функция отрисовки одного пина
  var renderPin = function (obj) {
    var pinNew = pinTemplate.cloneNode(true);
    pinNew.querySelector('img').src = obj.author.avatar;
    pinNew.style.left = window.advertisement.getPinX(obj.location.x, PIN_WIDTH) + 'px';
    pinNew.style.top = window.advertisement.getPinY(obj.location.y, PIN_HEIGHT) + 'px';
    return pinNew;
  };


  // Вставка объявления на страницу
  var insertAdvertisement = function (obj) {
    var adElement = window.advertisement.renderAdvertisement(obj);
    map.insertBefore(adElement, mapFiltersContainer);

    var popupButtonClose = document.querySelector('.popup__close');
    popupButtonClose.addEventListener('click', window.map.closeCard);

    map.addEventListener('keydown', function (evt) {
      if (window.service.isEscKeycode) {
        window.map.closeCard();
      }
    });
  };

  // Слушатель клика по пину.
  var addClickListener = function (elem, obj) {
    elem.addEventListener('click', function () {
      window.map.closeCard();
      insertAdvertisement(obj);
    });
  };

  // Функция вставки пинов на страницу
   window.insertPins =  function (arr) {
    var fragment = document.createDocumentFragment();
    var pinsCount = arr.length > MAX_PINS ? MAX_PINS : arr.length;
    for (var i = 0; i < pinsCount; i++) {
      var pinElement = renderPin(arr[i]);
      addClickListener(pinElement, arr[i]);
      fragment.appendChild(pinElement);
    }
    mapPins.appendChild(fragment);
  };

})();
