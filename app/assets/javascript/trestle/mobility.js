Trestle.init(function(e, root) {
  function init() {
    $(root).find('.mobility').each(function() {
      var instance = new Mobility(this);
      instance.initEvents();
      instance.chooseLanguage();
    })
  }

  var Mobility = function (element) {
    this.$element = $(element);
    this.$inputFields = this.$element.find('.mobility-field');
    this.$dropdownItems = this.$element.find('.dropdown-item');
    this.$button = this.$element.find('.mobility-active');
    this.$deeplTranslationAction = this.$element.find('.mobility__deepl');
    this.activeLocale = this.$element.data('active');
  };

  Mobility.prototype.chooseLanguage = function (flag) {
    var self = this;

    this.$inputFields.each(function() {
      var field = $(this);
      var active = field.data('locale') !== self.activeLocale;
      field.toggleClass('mobility-field--hidden', active)
    })

    this.$dropdownItems.each(function() {
      var item = $(this);
      var active = item.data('locale') === self.activeLocale;
      item.toggleClass('active', active)
    })

    if (flag) this.$button.text(flag);
    if (this.$deeplTranslationAction) this.presentDeepl();
  }

  Mobility.prototype.getActiveField = function () {
    return this.$element.find('.mobility-field[data-locale="' + this.activeLocale +'"]');
  }

  Mobility.prototype.getFieldByLocale = function (locale) {
    return this.$element.find('.mobility-field[data-locale="' + locale +'"]');
  }

  Mobility.prototype.presentDeepl = function () {
    var self = this;
    var actionable = !this.getActiveField().val();

    this.$deeplTranslationAction.toggleClass('mobility__deepl--actionable', actionable)

    if (actionable) {
      this.$deeplTranslationAction.find('.dropdown-item').each(function() {
        var item = $(this);
        item.toggleClass('disabled', item.data('locale') === self.activeLocale)
      })
    }
  }

  Mobility.prototype.dismissDeepl = function () {
    this.$deeplTranslationAction.removeClass('mobility__deepl--actionable')
  }

  Mobility.prototype.deeplTranslate = function (fromLocale) {
    var self = this;
    var path = this.$deeplTranslationAction.data('remote-path');
    var queryParams = this.$deeplTranslationAction.data('deepl-query-params');
    var data = {
      translation: {
        text: this.getFieldByLocale(fromLocale).val(),
        from_locale: fromLocale,
        to_locale: this.activeLocale,
        query_params: queryParams
      }
    }

    this.$deeplTranslationAction.addClass('mobility__deepl--active');

    $.post(path, data, function() {
      self.$deeplTranslationAction.removeClass('mobility__deepl--active');
    }).done(function(text) {
      self.getActiveField().val(text);
      self.dismissDeepl();
    });
  }

  Mobility.prototype.initEvents = function () {
    var self = this;

    this.$element.find('.mobility__languages .dropdown-item').on('click', function () {
      var $item = $(this);
      self.activeLocale = $item.data('locale');
      self.chooseLanguage($item.text());
    });

    this.$element.find('.mobility__deepl-languages .dropdown-item').on('click', function (e) {
      var $item = $(this);

      if ($item.hasClass('disabled')) {
        e.preventDefault();
        e.stopPropagation();
        return;
      }

      self.deeplTranslate($item.data('locale'));
    });

    if (this.$deeplTranslationAction) {
      this.$inputFields.on('change', function() {
        self.presentDeepl()
      })
    }
  };

  init();
});
