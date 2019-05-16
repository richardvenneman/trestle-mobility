Trestle.init(function(e, root) {
  function init() {
    $(root).find('.mobility').each(function() {
      new Mobility(this);
    })
  }

  function Mobility (element) {
    var element = $(element);
    var activeLocale = element.data('active');
    var button = element.find('.mobility-active');
    var inputFields = element.find('.mobility-field');
    var dropdownItems = element.find('.dropdown-item');
    var deeplTranslationAction = element.find('.mobility__deepl');

    function getActiveField () {
      return element.find('.mobility-field[data-locale="' + activeLocale +'"]');
    }

    function getFieldByLocale (locale) {
      return element.find('.mobility-field[data-locale="' + locale +'"]');
    }

    function toggle (flag) {
      $(inputFields).each(function() {
        var field = $(this);
        var active = field.data('locale') !== activeLocale;

        field.toggleClass('hidden', active)
      })

      $(dropdownItems).each(function() {
        var field = $(this);
        var active = field.data('locale') === activeLocale;

        field.toggleClass('active', active)
      })

      if (flag) {
        button.text(flag);
      }

      if (deeplTranslationAction) {
        toggleDeepl(element);
      }
    }

    function toggleDeepl (element) {
      var element = $(element);

      if (deeplTranslationAction) {
        var actionable = !getActiveField().val();

        deeplTranslationAction.toggleClass('mobility__deepl--actionable', actionable)

        if (actionable) {
          var actions = deeplTranslationAction.find('.dropdown-item');

          actions.each(function() {
            var item = $(this);
            item.toggleClass('disabled', item.data('locale') === activeLocale)
          })
        }
      }
    }

    function deeplTranslate (locale) {
      var path = deeplTranslationAction.data('remote-path');
      var data = {
        translation: {
          text: getFieldByLocale(locale).val(),
          from_locale: locale,
          to_locale: activeLocale
        }
      }

      deeplTranslationAction.addClass('mobility__deepl--active');

      $.post(path, data, function() {
        deeplTranslationAction.removeClass('mobility__deepl--active');
      }).done(function(text) {
        getActiveField().val(text);
      });
    }

    if (deeplTranslationAction) {
      inputFields.on('change', function() {
        toggleDeepl($(this).closest('.mobility'))
      })
    }

    element.find('.mobility__languages .dropdown-item').on('click', function () {
      var item = $(this);
      activeLocale = item.data('locale');

      toggle(item.text());
    });

    element.find('.mobility__deepl-languages .dropdown-item').on('click', function (e) {
      var item = $(this);

      if (item.hasClass('disabled')) {
        e.preventDefault();
        e.stopPropagation();
        return;
      }

      deeplTranslate(item.data('locale'));
    });

    toggle()
  }

  init();
});
