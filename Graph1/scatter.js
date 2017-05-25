var margin = { top: 50, right: 300, bottom: 50, left: 50 },
    outerWidth = 1500,
    outerHeight = 700,
    width = outerWidth - margin.left - margin.right,
    height = outerHeight - margin.top - margin.bottom;

var x = d3.scale.linear()
    .range([0, width]).nice();

var y = d3.scale.linear()
    .range([height, 0]).nice();

var Ages = ["Female","Male","13-18","22-29"];	
	
var xCat = "AgeGroupID",
    yCat = "IsPositive",
    rCat = "GenderID",
	size = "ImageAnalysisLowAge",
    colorCat = "GenderID";

d3.csv("UserProperties.csv", function(data) {
  data.forEach(function(d) {
  //ID,UserID,SubjectID,IsPositive,AgeGroupID,GenderID,RelevantTweetsCount,ImageAnalysisGender,
  //ImageAnalysisGenderConfidence,ImageAnalysisLowAge,ImageAnalysisHighAge,ImageAnalysisAgeConfidence,ImageAnalysisChecked
	d.ID = +d.ID;
	d.UserID = +d.UserID;
	d.SubjectID = +d.SubjectID;
	d.IsPositive = +d.IsPositive;
	d.AgeGroupID = +d.AgeGroupID;
	d.GenderID = +d.GenderID;
	d.RelevantTweetsCount = +d.RelevantTweetsCount;
	d.ImageAnalysisGender = +d.ImageAnalysisGender;
	d.ImageAnalysisGenderConfidence = +d.ImageAnalysisGenderConfidence;
	d.ImageAnalysisLowAge = +d.ImageAnalysisLowAge;
	d.ImageAnalysisHighAge = +d.ImageAnalysisHighAge;
	d.ImageAnalysisAgeConfidence = +d.ImageAnalysisAgeConfidence;
	d.ImageAnalysisChecked = +d.ImageAnalysisChecked;

	
    //d["Cups per Serving"] = +d["Cups per Serving"];

  });

  var xMax = d3.max(data, function(d) { return d[xCat]; }) * 1.05,
      xMin = d3.min(data, function(d) { return d[xCat]; }),
      xMin = xMin > 0 ? 0 : xMin,
      yMax = d3.max(data, function(d) { return d[yCat]; }) * 1.05,
      yMin = d3.min(data, function(d) { return d[yCat]; }),
      yMin = yMin > 0 ? 0 : yMin;

  x.domain([xMin, xMax]);
  y.domain([yMin, yMax]);

  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")
      .tickSize(-height);

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      .tickSize(-width);

  var color = d3.scale.category10();

  var tip = d3.tip()
      .attr("class", "d3-tip")
      .offset([-10, 0])
      .html(function(d) {
        return xCat + ": " + d[xCat] + "<br>" + yCat + ": " + d[yCat];
      });

  var zoomBeh = d3.behavior.zoom()
      .x(x)
      .y(y)
      .scaleExtent([0, 500])
      .on("zoom", zoom);

  var svg = d3.select("#scatter")
    .append("svg")
      .attr("width", outerWidth)
      .attr("height", outerHeight)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(zoomBeh);

  svg.call(tip);

  svg.append("rect")
      .attr("width", width)
      .attr("height", height);

  svg.append("g")
      .classed("x axis", true)
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .classed("label", true)
      .attr("x", width)
      .attr("y", margin.bottom - 10)
      .style("text-anchor", "end")
      .text(xCat);

  svg.append("g")
      .classed("y axis", true)
      .call(yAxis)
    .append("text")
      .classed("label", true)
      .attr("transform", "rotate(-90)")
      .attr("y", -margin.left)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text(yCat);

  var objects = svg.append("svg")
      .classed("objects", true)
      .attr("width", width)
      .attr("height", height);

  objects.append("svg:line")
      .classed("axisLine hAxisLine", true)
      .attr("x1", 0)
      .attr("y1", 0)
      .attr("x2", width)
      .attr("y2", 0)
      .attr("transform", "translate(0," + height + ")");

  objects.append("svg:line")
      .classed("axisLine vAxisLine", true)
      .attr("x1", 0)
      .attr("y1", 0)
      .attr("x2", 0)
      .attr("y2", height);

  objects.selectAll(".dot")
      .data(data)
    .enter().append("circle")
      .classed("dot", true)
      .attr("r", function (d) { return 2* Math.sqrt(d[size] / Math.PI); })
      .attr("transform", transform)
      .style("fill", function(d) { return color(d[colorCat]); })
	  .on("mouseover", function(d){
	  tip.show(d);
	  d3.select(this).attr("r", 10).style("fill", "red");
	  } ) 
      .on("mouseout", function(d){
	  tip.hide(d);
	  d3.select(this)
	  
	  .attr("r", 10).style("fill", function(d) { return color(d[colorCat]); })
	  .attr("r", function (d) { return 2* Math.sqrt(d[size] / Math.PI); })
      .attr("transform", transform);
	  });
	  
	  
function whatdoto(d){
tip.show(d);
//d3.select(this).attr("r", 10).style("fill", "red");
}	  
//d3.select(this).attr("r", 10).style("fill", "red");	  

  var legend = svg.selectAll(".legend")
      .data(color.domain())
    .enter().append("g")
      .classed("legend", true)
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("circle")
      .attr("r", 3.5)
      .attr("cx", width + 20)
      .attr("fill", color);

  legend.append("text")
      .attr("x", width + 26)
      .attr("dy", ".35em")
      .text(function(d) { return Ages[d-1]; });

  d3.select("input").on("click", change);

  function change() {

    xMax = d3.max(data, function(d) { return d[xCat]; });
    xMin = d3.min(data, function(d) { return d[xCat]; });

    zoomBeh.x(x.domain([xMin, xMax])).y(y.domain([yMin, yMax]));

    var svg = d3.select("#scatter").transition();

    svg.select(".x.axis").duration(750).call(xAxis).select(".label").text(xCat);

    objects.selectAll(".dot").transition().duration(1000).attr("transform", transform);
  }

  function zoom() {
    svg.select(".x.axis").call(xAxis);
    svg.select(".y.axis").call(yAxis);

    svg.selectAll(".dot")
        .attr("transform", transform);
  }

  function transform(d) {
    return "translate(" + x(d[xCat]) + "," + y(d[yCat]) + ")";
  }
});