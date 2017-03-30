$(document).ready(function() {
		$("select").selectBox();
	});

$(function() {
		$("#page1").click(function(){
		     $("#page1").css("backgroundColor","#59B7C2");
		     $("#page2").css("backgroundColor","#FFFFFF");
		     $("#page3").css("backgroundColor","#FFFFFF");
		     $("#page4").css("backgroundColor","#FFFFFF");
	      });  
		$("#page2").click(function(){
		     $("#page2").css("backgroundColor","#59B7C2");
		     $("#page1").css("backgroundColor","#FFFFFF");
		     $("#page3").css("backgroundColor","#FFFFFF");
		     $("#page4").css("backgroundColor","#FFFFFF");
	      }); 
		$("#page3").click(function(){
		     $("#page3").css("backgroundColor","#59B7C2");
		     $("#page1").css("backgroundColor","#FFFFFF");
		     $("#page2").css("backgroundColor","#FFFFFF");
		     $("#page4").css("backgroundColor","#FFFFFF");
	      }); 
	      $("#page4").click(function(){
		     $("#page4").css("backgroundColor","#59B7C2");
		     $("#page1").css("backgroundColor","#FFFFFF");
		     $("#page2").css("backgroundColor","#FFFFFF");
		     $("#page3").css("backgroundColor","#FFFFFF");
	      });
	  $(window).resize();
	});

$(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });             
})