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
    }

    element.find('.dropdown-item').on('click', function () {
      var item = $(this);
      activeLocale = item.data('locale');

      toggle(item.text());
    });

    toggle()
  }

  init();
});
