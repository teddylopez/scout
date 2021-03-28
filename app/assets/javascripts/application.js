// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function () {
  initInputGroups();
});

function initInputGroups() {
  const $groupedBtns = $("input.grouped-inputs");

  $.each($groupedBtns, (index, button) => {
    const $this = $(button);
    const $key = $this[0].dataset.key;
    const $container = $("div.card[data-container='" + $key + "']");

    if ($this.val()) {
      $container.addClass("toggle-group-selected");
    }

    $this.on("focus", () => {
      $container.addClass("toggle-group-selected");
    });

    $this.focusout(() => {
      if (!$this.val()) {
        $container.removeClass("toggle-group-selected");
      }
    });
  });
}
