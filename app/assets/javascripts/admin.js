//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require channels/index
//= require admin_channels/stats
//= require canvasjs.min
//= require_self

jQuery(function($) {
  // setup admin charting
  if ($("#chart-container-js").length > 0) {
    // datapoints, which will be available to any executing javascript on page
    // we will just add values onto the end and shift as necessary.
    window.dps = {
      event: [],
      message: [],
      login: [],
      bongo: [],
    };
    var chart = new CanvasJS.Chart("chart-container-js", {
      title: { text: "Hot Chat Data" },
      toolTip: { shared: true },
      legend: {
        cursor: "pointer",
        itemclick: function(e) {
          e.dataSeries.visible = ! (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible);
          chart.render();
        }
      },
      data: [
        { type: "line", name: "event",        showInLegend: true, dataPoints: window.dps.event },
        { type: "line", name: "message sent", showInLegend: true, dataPoints: window.dps.message },
        { type: "line", name: "login",        showInLegend: true, dataPoints: window.dps.login },
        { type: "line", name: "bongo",        showInLegend: true, dataPoints: window.dps.bongo }
      ]
    });

    var xVal = 0;
    var updateInterval = 1000; // 1s
    var dataLength = 500; // number of dataPoints visible at any point
    var updateChart = function (count) {
      count = count || 1;
      for (var j = 0; j < count; j++) {
        window.dps.event.push({ x: xVal, y: 0 });
        window.dps.message.push({ x: xVal, y: 0 });
        window.dps.login.push({ x: xVal, y: 0 });
        window.dps.bongo.push({ x: xVal, y: 0 });
        xVal++;
      };
      if (window.dps.event.length > dataLength) {
        window.dps.event.shift();
        window.dps.message.shift();
        window.dps.login.shift();
        window.dps.bongo.shift();
      }
      chart.render();
    };

    // initialize values to zeroes
    updateChart(dataLength);

    // update chart after specified time.
    setInterval(function(){ updateChart() }, updateInterval);
  }
});
