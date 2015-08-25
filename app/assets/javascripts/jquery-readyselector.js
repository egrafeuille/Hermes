/**
 * @author EEG
 */
(function($) {
  var ready;
  ready = $.fn.ready;
  $.fn.ready = function(fn) {
    if (this.context === void 0) {
      ready(fn);
    } else if (this.selector) {
      ready($.proxy((function() {
        $(this.selector, this.context).each(fn);
      }), this));
    } else {
      ready($.proxy((function() {
        $(this).each(fn);
      }), this));
    }
  };
})(jQuery);