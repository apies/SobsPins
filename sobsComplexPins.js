// Generated by CoffeeScript 1.3.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $(document).ready(function() {
    var OverLay, OverLayView, SobsPin, SobsPinView, SobsPins, overLay, pin, pinView, pins, _i, _len, _results;
    OverLay = (function(_super) {

      __extends(OverLay, _super);

      OverLay.name = 'OverLay';

      function OverLay() {
        return OverLay.__super__.constructor.apply(this, arguments);
      }

      OverLay.prototype.defaults = {
        color: 'black',
        opacity: '0.5',
        top: 0
      };

      OverLay.prototype.height = 400;

      OverLay.prototype.width = 400;

      return OverLay;

    })(Backbone.Model);
    OverLayView = (function(_super) {

      __extends(OverLayView, _super);

      OverLayView.name = 'OverLayView';

      function OverLayView() {
        this.render = __bind(this.render, this);
        return OverLayView.__super__.constructor.apply(this, arguments);
      }

      OverLayView.prototype.initialize = function() {
        return this.render();
      };

      OverLayView.prototype.render = function() {
        var overLayTemplate, overModel;
        overModel = new OverLay({
          top: $(document).scrollTop()
        });
        overLayTemplate = ich.overLay(overModel.toJSON());
        $('body').append(overLayTemplate);
        return this;
      };

      return OverLayView;

    })(Backbone.View);
    SobsPin = (function(_super) {

      __extends(SobsPin, _super);

      SobsPin.name = 'SobsPin';

      function SobsPin() {
        return SobsPin.__super__.constructor.apply(this, arguments);
      }

      SobsPin.sizeImage = function(width, height, newWidth) {
        var newHeight, ratio;
        console.log('running size function!');
        ratio = height / width;
        return newHeight = ratio * newWidth;
      };

      return SobsPin;

    })(Backbone.Model);
    SobsPins = (function(_super) {

      __extends(SobsPins, _super);

      SobsPins.name = 'SobsPins';

      function SobsPins() {
        return SobsPins.__super__.constructor.apply(this, arguments);
      }

      SobsPins.prototype.model = SobsPin;

      SobsPins.fetchPins = function() {
        var pins;
        console.log('Fetch Pins Being Called!');
        pins = [];
        $('.separator > a').each(function() {
          var sobsPin;
          console.log("height:" + ($(this).children('img').height()));
          console.log("width:" + ($(this).children('img').width()));
          sobsPin = new SobsPin({
            escapedUrl: encodeURIComponent(this.href),
            imgUrl: this.href,
            altText: "Alt Text Coming Soon!",
            postUrl: "www.quietlikehorses.com",
            width: 150,
            height: SobsPin.sizeImage($(this).children('img').height(), $(this).children('img').width(), 150)
          });
          console.log(sobsPin);
          return pins.push(sobsPin);
        });
        return pins;
      };

      return SobsPins;

    }).call(this, Backbone.Collection);
    SobsPinView = (function(_super) {

      __extends(SobsPinView, _super);

      SobsPinView.name = 'SobsPinView';

      function SobsPinView() {
        this.render = __bind(this.render, this);
        return SobsPinView.__super__.constructor.apply(this, arguments);
      }

      SobsPinView.prototype.tagName = 'li';

      SobsPinView.prototype.initialize = function() {};

      SobsPinView.prototype.render = function() {
        var imgSquareTemplate;
        imgSquareTemplate = ich.imgPinSquare(this.model.toJSON());
        $(this.el).html(imgSquareTemplate);
        return this;
      };

      SobsPinView.prototype.pinMe = function() {
        alert(JSON.stringify(this.model.toJSON()));
        $(this).children('img').effect("shake", {
          times: 3
        }, 300);
        $(this).hide("explode", 1000);
        return console.log($(this).children('img'));
      };

      SobsPinView.prototype.rockNRoll = function() {
        alert(JSON.stringify(this.model.toJSON()));
        return console.log($(this));
      };

      SobsPinView.prototype.events = {
        'click button': 'pinMe'
      };

      return SobsPinView;

    })(Backbone.View);
    overLay = new OverLayView;
    console.log(SobsPin.sizeImage(234, 456, 645));
    pins = SobsPins.fetchPins();
    console.log(pins);
    _results = [];
    for (_i = 0, _len = pins.length; _i < _len; _i++) {
      pin = pins[_i];
      pinView = new SobsPinView({
        model: pin
      });
      $('ul#pinList').append(pinView.render().el);
      _results.push(console.log(pinView));
    }
    return _results;
  });

}).call(this);
