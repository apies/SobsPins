(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  $(document).ready(function() {
    var OverLay, OverLayView, SobsPin, SobsPinView, SobsPins;
    OverLay = (function(_super) {

      __extends(OverLay, _super);

      function OverLay() {
        OverLay.__super__.constructor.apply(this, arguments);
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

      function OverLayView() {
        this.render = __bind(this.render, this);
        OverLayView.__super__.constructor.apply(this, arguments);
      }

      OverLayView.prototype.initialize = function() {
        return this.render();
      };

      OverLayView.prototype.render = function() {
        var overLayTemplate, overModel;
        overModel = new OverLay;
        overLayTemplate = ich.overLay(overModel.toJSON());
        console.log(overLayTemplate);
        $('body').append(overLayTemplate);
        return this;
      };

      return OverLayView;

    })(Backbone.View);
    SobsPin = (function(_super) {

      __extends(SobsPin, _super);

      function SobsPin() {
        SobsPin.__super__.constructor.apply(this, arguments);
      }

      SobsPin.sizeImage = function(width, height, newWidth) {
        var newHeight, ratio;
        ratio = height / width;
        return newHeight = ratio * newWidth;
      };

      return SobsPin;

    })(Backbone.Model);
    SobsPins = (function(_super) {

      __extends(SobsPins, _super);

      function SobsPins() {
        SobsPins.__super__.constructor.apply(this, arguments);
      }

      SobsPins.prototype.model = SobsPin;

      SobsPins.fetchPins = function() {
        var pins;
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
            height: SobsPin.sizeImage($(this).children('img').width(), $(this).children('img').height(), 150)
          });
          return pins.push(sobsPin);
        });
        return pins;
      };

      return SobsPins;

    })(Backbone.Collection);
    SobsPinView = (function(_super) {

      __extends(SobsPinView, _super);

      function SobsPinView() {
        this.render = __bind(this.render, this);
        SobsPinView.__super__.constructor.apply(this, arguments);
      }

      SobsPinView.prototype.tagName = 'li';

      SobsPinView.prototype.className = 'photoPin';

      SobsPinView.prototype.initialize = function() {};

      SobsPinView.prototype.render = function() {
        var imgSquareTemplate;
        imgSquareTemplate = ich.imgPinSquare(this.model.toJSON());
        $(this.el).html(imgSquareTemplate);
        return this;
      };

      SobsPinView.prototype.pinMe = function() {
        console.log($(this.el));
        $(this.el).effect("shake", {
          times: 3
        }, 300);
        $(this.el).hide("explode", 1000);
        return this;
      };

      SobsPinView.prototype.rockNRoll = function() {
        alert(JSON.stringify(this.model.toJSON()));
        console.log($(this));
        return this;
      };

      SobsPinView.prototype.events = {
        'click button': 'pinMe'
      };

      return SobsPinView;

    })(Backbone.View);
    return $('.post-footer').each(function() {
      $(this).append('<img src="http://passets-lt.pinterest.com/images/about/buttons/big-p-button.png" width="60" height="60" alt="Follow Me on Pinterest" />');
      return $(this).click(function() {
        var overLay, pin, pinView, pins, _i, _len, _results;
        overLay = new OverLayView;
        pins = SobsPins.fetchPins();
        _results = [];
        for (_i = 0, _len = pins.length; _i < _len; _i++) {
          pin = pins[_i];
          pinView = new SobsPinView({
            model: pin
          });
          _results.push($('ul#pinList').append(pinView.render().el));
        }
        return _results;
      });
    });
  });

}).call(this);
