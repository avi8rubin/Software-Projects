var w = 500,
	h = 500;

var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = ['Month'];

//Data
var d = [
		  [
			{axis:"January",value:1378},
			{axis:"February",value:1147},
			{axis:"March",value:1374},
			{axis:"April",value:1485},
			{axis:"May",value:1863},
			{axis:"June",value:1622},
			{axis:"July",value:1467},
			{axis:"August",value:1436},
			{axis:"September ",value:1237},
			{axis:"October",value:1202},
			{axis:"November",value:1102},
			{axis:"December",value:1142}
		  ]
		  /*,[
			{axis:"January",value:0.99},
			{axis:"February",value:0.56},
			{axis:"March",value:0.42},
			{axis:"April",value:0.14},
			{axis:"May",value:0.88},
			{axis:"June",value:0.64},
			{axis:"July",value:0.61},
			{axis:"August",value:0.75},
			{axis:"September ",value:0.47},
			{axis:"October",value:0.22},
			{axis:"November",value:0.27},
			{axis:"December",value:0.03}
		  ]*/
		];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 0.6,
  levels: 6,
  ExtraWidthX: 300
}

//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#chart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#body')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
var text = svg.append("text")
	.attr("class", "title")
	.attr('transform', 'translate(90,0)') 
	.attr("x", w - 70)
	.attr("y", 10)
	.attr("font-size", "12px")
	.attr("fill", "#404040")
	.text("Represents the number of visits per month");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w - 65)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 52)
	  .attr("y", function(d, i){ return i * 20 + 9;})
	  .attr("font-size", "11px")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;	