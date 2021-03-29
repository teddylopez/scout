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
  clickableRows();
});

function initInputGroups() {
  var $groupedBtns = $("input.grouped-inputs");

  $.each($groupedBtns, function (index, button) {
    var $this = $(button);
    var $key = $this[0].dataset.key;
    var $container = $("div.card[data-container='" + $key + "']");

    if ($this.val()) {
      $container.addClass("toggle-group-selected");
    }

    $this.on("focus", function () {
      $container.addClass("toggle-group-selected");
    });

    $this.focusout(function () {
      if (!$this.val()) {
        $container.removeClass("toggle-group-selected");
      }
    });
  });
}

function clickableRows() {
  var $rows = $("table.clickable-table tr[data-href]");
  $.each($rows, function (index, object) {
    $(object).on("click", function () {
      var $this = $(object);
      window.location.href = $this[0].dataset.href;
    });
  });
}
