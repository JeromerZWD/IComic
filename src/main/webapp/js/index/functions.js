/*
*
*	Class JS
*/
	var defaultClass = {
		fixColumns : function() {
			$(".column-grid").each(function() {
				var columns = $(this).children();
				
				if(columns.length > 1)
				{
					var lastColumn = columns.last();
					lastColumn.css({
						"marginRight" : 0
					});
				} else return;
			});
		},


		showTitle : function( elem ) {
			if(typeof speed == "undefined") speed = 150;
			$(elem).each(function() {
				var title = $(this).attr("title");
				$("<span/>", {
					text : title
				}).insertAfter($(this)).addClass("infotitle");
			});
			
			$(elem).hover(function() {
				$(this).next().stop().animate({
					opacity : 1
				}, speed);
			}, function() {
				$(this).next().stop().animate({
					opacity : 0
				}, speed);
			});
		},
		
		showLikeComment : function(elem) {
			$(".blog-excerpt-bottom").hide();
			
			$(elem).hover(function() {
				$(this).find(".blog-excerpt-bottom").show();
			}, function() {
				$(this).find(".blog-excerpt-bottom").hide();
			});
		},
		
		animateBar : function(elem, speed) {
			if(typeof speed == "undefined") speed = 3000;
			$(elem).each(function() {
				$this = $(this);
				var percentage = parseInt( $this.find("span.right").text() );
				
				$this.animate({
					width : percentage + "%"
				}, {
					duration : speed,
					queue : false
				});
			});
		},
		
		centerPortfolioIcons : function() {
			var list = $("div#portfolio-categories ul");
			var marginLeft = (960 - list.width()) / 2;
			list.css("marginLeft", marginLeft);
		},
		
		itemsHoverPortfolio : function() {
			$("a.portfolio-sphere, div.navigation a").hover(function() {
				$(this).find("span.title-portfolio").hide();
			}, function() {
				$(this).find("span.title-portfolio").show();
			});
		},
		
		filterItems : function() {
			// filter items when filter link is clicked
			var $container = $('ul#destination');
			$('ul#source li').click(function(){
				var selector = ($(this).data('id') == "*") ? "*" : "." + $(this).data('id');
				$container.isotope({
					animationEngine : 'jquery',
					animationOptions: {
						duration: 750,
						easing: 'linear',
						queue: false
				    }
				});
				$container.isotope({filter: selector });
			    return false;
			});
		},
		
		googleMap : function(map_id , glat , glon ,zoomval , gtitle, ghtml, gicon) {
			if (glat == "") { glat =0; }
			if (glon == "") { glon = 0; }
			if (gtitle == "") { gtitle = "Contacts"; }
			if (gicon == "") { gicon = "../../../maps.gstatic.com/intl/ru_ALL/mapfiles/markers/marker_sprite.png"; }
			if (zoomval == "") { zoomval = 8; }
			
			zoomval = parseInt(zoomval);

			var myLatlng = new google.maps.LatLng(glat, glon);

			var myOptions = {
			  zoom: zoomval,
			  center: myLatlng,
			  mapTypeId: google.maps.MapTypeId.ROADMAP
			  // Change this to different map types
			  // ROADMAP
			  // SATELLITE
			  // HYBRID
			  // TERRAIN
			 }

			var map = new google.maps.Map(document.getElementById(map_id), myOptions);

			var contentString = ghtml;
				
			var infowindow = new google.maps.InfoWindow({
				content: contentString
			});

			var marker = new google.maps.Marker({
				position: myLatlng,
				map: map,
				title: gtitle,
				icon:gicon
			});
			google.maps.event.addListener(marker, 'click', function() {
			  infowindow.open(map,marker);
			});
		},
		
		setGridClear : function() {
			var addClear = "<div class='clear'></div>";
			$('.grid-clear').append(addClear);
		},
		
		setProcessIcons : function() {
			// create elements
			var elemSpan = "<span class='wp-process'>&nbsp;</span>";
			// retrieve elements 
			var designBrief = $("ul.work-list a.design-brief"),
				research = $("ul.work-list a.research"),
				designing = $("ul.work-list a.designing"),
				revisions = $("ul.work-list a.revisions"),
				pr_process = $("ul.work-list a.pr_process");
			$(designBrief).append( elemSpan );
			$(research).append( elemSpan );
			$(designing).append( elemSpan );
			$(revisions).append( elemSpan );
			$(pr_process).append( elemSpan );
		},
		
		isPage : function( page )
		{
			var currentPage = $('body').attr('class'); 
			if(currentPage == page) return true;
			return false;
		},
		
		getMenuActive : function() {
			var checkPage = /\b[a-zA-Z0-9]+\b\.(html)/gi;
			var location = window.location.pathname;
			var page = location.match( checkPage );
			$("ul#main-menu li a").each(function() {
				if(page == $(this).attr("href"))
				{
					$(this).addClass("active-state");
				}
			});
		},
		
		showContactText : function() {
			$(".icons-contact ul li a").on("click", function() {
				var text = $(this).attr("title");
				
				$("a.email-link").text( text );
				
				return false;
			});
		},
		
		returnFalse : function() {
			$("a[href='#']").on("click", function(e) {
				e.preventDefault();
			});
		},
		
		setPattern : function() {
			var pattern = "<span class='patt-bg'>&nbsp;</span>";
			var pattabs = "<span class='patt-bg-abs'>&nbsp;</span>";
			$("div#slider").append( pattern );
			$("a.big-button-style").append( pattabs );
			$(".projects-band ul li a").append( pattabs );
			$(".team-build ul li a").append( pattabs );
			$(".footer_image").append( pattabs );
			$("a.standart-button-style").append( pattabs );
			$("div.team-band ul li a").append( pattabs );
			$("div#page_header").append( pattabs );
			$("div.team-service ul li a").append( pattabs );
			$("div.portfolio-items ul li a").append( pattabs );
			$("a.portfolio-sphere").append( pattabs );
			$("div.navigation a").append( pattabs );
			$("a.thumb-blog").append( pattabs );
			$("div.slider_thumb a").append( pattabs );
			
			if(!jQuery.browser.opera) // if not opera browser
			{
				$("span.circle-area").append( pattabs );
				$("div.circle-area").append( pattabs );
				$("ul.work-list li a").append( pattabs );
				$(".icons-contact ul li a").append( pattabs );
			}
		},
		
		socialHover : function() {
			$("ul.social-icons li a").hover(function() {
				$(this).animate({"bottom" : "7px"}, 100);
			}, function() {
				$(this).animate({"bottom" : "0px"}, 100);
			});
		},
		
		getProcessText : function() {
			var elem = $("div.work-text");
			var elemHeight = elem.height();

			$("ul.work-list li a").hover(function() {
				thetexttoshow = $(this).attr("title");
				var x = $(this).offsetParent().position().left;
				elem.css({
					left : x + "px"
				}).text( thetexttoshow );
			});
			
			$("div.work-process").mouseleave(function() {
				elem.text("");
			});
		},
		
		Slider : {
			init : function() {
			
				this.alignBullets();
				this.showBullets();
				this.activeCat();
				this.getActive();
				this.toggleCategories();
				this.showDescription();
				this.getImageChange();
				
				$(".inside-controls a:first-child").addClass("active");
			}, 
			
			alignBullets : function() {
				$("div.inside-controls").each(function() {
					var size = $(this).children().length;
					var width = size * 15;
					
					$(this).css({
						"width" : width + "px",
						"margin" : 110 + "px auto"
					});
				});
			},
			
			showBullets : function() {
				$("div.inside-controls").css("opacity", 1);
				$("div.inside-controls:not(.active)").css("opacity", 0);
			},
			
			hideBullets : function() {
				$("div.inside-controls").removeClass("active");
			},
			
			showDescription : function(autoshow) {
				$("div.categories-slider").find("div.slider-cat-description h2").text( "" );
				$("div.categories-slider").find("div.slider-cat-description p.slider-text").text( "" );
						
				$("div.categories-slider").each(function() {
					if($(this).hasClass("active"))
					{
						$this = $(this);
						var image = $this.find("img.active");
						titleforImage = image.attr("title");
						textforImage = image.attr("alt");
						
						// display description
						titleforImage = $this.find("div.slider-cat-description h2").text( titleforImage ).hide();
						textforImage = $this.find("div.slider-cat-description p.slider-text").text( textforImage ).hide();
						
						$("div#slider").hover(function() {
							titleforImage.fadeIn(400);
							textforImage.fadeIn(800);
						}, function() {
							titleforImage.fadeOut(100);
							textforImage.fadeOut(100);
						});
					}
				});
				
				if(typeof autoshow !== "undefined")
				{
					titleforImage.fadeIn(400);
					textforImage.fadeIn(800);
				}
			},
			
			activeCat : function() {
				var Self = this;
				$("div.categories-slider").each(function() {
					if($(this).hasClass("active"))
					{
						// reactivate the set interval
						if(typeof idtotestfor == "undefined") idtotestfor = $(this).attr("id");
						if(idtotestfor != $(this).attr("id")) 
						{
							clearInterval(intervalTriggerSlider);
							idtotestfor = $(this).attr("id");
							Self.getAnimation();
						}
						
						var controls = $(this).find(".controls");
						// do the stuff
						controls.css({
							"backgroundPosition" : "0 0",
							"marginTop" : "-20px"
						});
						
						controls.find(".inside-controls").css({
							"paddingTop" : "20px"
						});
						
						
						// find all images and hide
						//console.log($(this).html());
						$(this).find("img").each(function() {
							if($(this).hasClass("active")) return
							else $(this).css("display","none");
						});
						
					}
				});
			}, 
			
			// this will activate the category on user click
			getActive : function() {
				var Self = this;
				
				$("div.controls").on("click", function() {
					Self.removeActive();

					$this = $(this);
					$this.find(".inside-controls").addClass("active");
					$this.closest(".categories-slider").addClass("active");
					
					Self.activeCat();
					Self.showBullets();
					Self.toggleCategories();
					Self.showDescription( "true" );
				});
			},
			
			removeActive : function() {
				var Self = this;
				Self.hideBullets();
				
				$("div.categories-slider").each(function() {
					var controls = $(this).find(".controls");
						$(this).removeClass("active");
					// do the stuff
					controls.css({
						"backgroundPosition" : "0 100%",
						"marginTop" : "0px"
					});
					
					controls.find(".inside-controls").removeClass("active").css({
						"paddingTop" : "0"
					});
					//controls.find(".inside-controls a").removeClass("active");
				});
			},
			
			toggleCategories : function() {
				$("div.categories-slider").each(function() {
					if(!$(this).hasClass("active"))
					{
						$(this).find("img").addClass("hide");
					}
					else
					{
						$(this).find("img").removeClass("hide");
					}
				});
			},
			
			getImageChange : function() {
				var Self = this;
				Self.getAnimation();
				$("div.inside-controls a").on("click getSliderClick", function(e) {
					e.preventDefault();
					
					
					$(this).closest(".categories-slider").find("img").each(function() {
						if($(this).hasClass("active")) return
						else $(this).css("display","none");
					});
					
					if(e.type == "click") clearInterval( intervalTriggerSlider );
					
					$this = $(this);
					$this.siblings().removeClass("active").end().addClass("active");
					
					
					var index = $this.index();
					
					var category = $this.closest(".categories-slider");
					var images = category.find("img");
					images.siblings(".active").removeClass("active");
					var current = images.eq( index ).addClass("active");
					
					current.fadeIn(500);
					
					Self.showDescription();
				});
			},
			
			getAnimation : function() {
				var Self = this, integer = 0,indexTrigger=null;
				
				intervalTriggerSlider = window.setInterval(function() {
					integer++;
					
					$("div.inside-controls").each(function() {
						if($(this).hasClass("active"))
						{
							$thisCat = $(this);
							indexTrigger = $thisCat.find("a").length;
						}
					});
					if(integer < indexTrigger)
					{
						$thisCat.find("a.active").next().trigger("getSliderClick");
					}
					else
					{
						integer = 0;
						$thisCat.find("a").eq(0).trigger("getSliderClick");
					}
				}, 7000);
				
			},
			
			footerSlider : {
				init : function() {
					this.getWork();
				},
				
				getWork : function() {
					var size = $("div.footer_image img").length;
					var integer = 0;
					$("div.footer_image img:not(.active)").hide();
					
					
					window.setInterval(function() {
						integer++;
						
						$("div.footer_image img").on("elemClick", function() {
							if(integer == size)
							{
								$("div.footer_image img").eq( size - 1 ).removeClass("active").fadeOut(800);
								var elem = $(this).addClass("active");
								elem.fadeIn(800);
								integer = 0;
							}
							else
							{
								$(this).prev().removeClass("active").fadeOut(800);
								var elem = $(this).addClass("active");
								elem.fadeIn(800);
							}
						});
						
						if(integer == size)
						{
							$("div.footer_image img").first().trigger("elemClick");
						}
						else
						{
							$("div.footer_image img.active").next().trigger("elemClick");
						}
					}, 5000);
					
				}
			}
			
			
		},
		
		sendContact : function() {
			$("form#contactForm").on("submit", function(e) {
				e.preventDefault();
				var data = $(this).serialize() + "&jact=sendContact";
				
				$.ajax({
					url : "php/sendEmail.php",
					data : data,
					dataType : "json",
					beforeSend : function() {
						$("p#resultofsend").html("<img src='images/ajax-loader.gif' alt='' />");
					},
					success : function(e) {
						if(e.err == false)
						{
							$("p#resultofsend").html( e.text ).css('color', '#6cb132');
						}
						else
						{
							$("p#resultofsend").html( e.text ).css('color', '#cc0000');
						}

					}
				});
			});
		}
		
	};

jQuery(document).ready(function() {

	if ( $.browser.msie ) {
	  var versionIE =  parseInt($.browser.version, 10);
	}
	
	// class functions
	defaultClass.returnFalse();
	defaultClass.fixColumns();	
	defaultClass.showTitle("div.team-build ul li a, div.team-band ul li a");
	defaultClass.showLikeComment("div.blog-entry");
	defaultClass.animateBar("div.project-complete-rate a");
	defaultClass.centerPortfolioIcons();
	defaultClass.itemsHoverPortfolio();	
	defaultClass.filterItems();
	defaultClass.setGridClear();
	defaultClass.setProcessIcons();
	defaultClass.setPattern();
	defaultClass.getMenuActive();
	defaultClass.showContactText();
	defaultClass.socialHover();
	defaultClass.getProcessText();
	defaultClass.sendContact();
	
	
	// the footer slider
	defaultClass.Slider.footerSlider.init();
	

	// home page
	if(defaultClass.isPage("home"))
	{
		defaultClass.Slider.init();
	}
	else if(defaultClass.isPage("contact"))
	{
		//google map init
		var html = "Str. Columna 173<br /> Mob: +373 69-283-592 <br /> E-mail: <a href='mailto:info@creatego.net?subject=Salut Creatego'>info@creatego.net</a>";
		defaultClass.googleMap('map', '47.038608','28.817804' , '14' , 'Creatego' , html);
	}
	
	
	
	/* Call of all plugins */
	$("div#projects, div#team, div#our-service").getScroll({
		visible : 4
	});
	
	
	// for column need [static-grid/dinamic-grid]
	(function() {	$(".static-grid, .dinamic-grid").each(function() {	 $(this).find(":last-child").css("marginRight",0);	});})();
	
	// mozile inline border fix
	if($.browser.mozilla)
	{
		$(".inline-border").each(function() {
			$this = $(this);
			if($this.children().length > 0)
			{
				if($this.find(">img").length > 0)
				{
					$this.find(">img").addClass("inline-border");
					$this.removeClass("inline-border");
				}
			}
		});
	}
	
	// declare this at the bottom, IE FIX
	if($.browser.msie && versionIE < 9)
	{
		return false;
	} 
	else
	{
		defaultClass.hoverEffect(".anim-effect, ul.work-list li a, div.projects-band ul li a, div.team-build ul li a, div.team-band ul li a, a.portfolio-sphere, div.portfolio-items ul li a, div.navigation a, a.contact-sphere, div.slider_thumb a, div.comments-block a.avatar");
	}

});

/*
*
*	Plugins Goes Below
*/

/*
*
* Date: 28.02.2012
* Version: 1.0
* Author : Wbx
* The scroll band plugin [jQuery]
* @param : [visible], [speed], [delay], [easing], [block], [arrows], [orientation]
* [visible]/default 5 -> "int" that represent number of visible block on the site of the scroll band
* [speed]/default 500 -> "int" the speed of animation
* [delay]/default 7000 -> "int" the time of waiting between animations |if it is set to true the delay will be infinite|
* [easing]/default linear -> "string" the type of animation |if not jqueryui easing included it can be only linear/swing|
* [block]/default li -> "string" the block that must be scroll
* [arrows]/default left/right -> "object" the arrows left and right |!!! the value must be specified in [data-arrows] attr|
* [orientation]/default horizontal -> "string" can be horizontal/vertical. if it set to horizontal it will be for x scroll and if vertical -> will be for vertical scroll box
*
*/

(function( $ )
{
	$.fn.getScroll = function( options )
	{
		
		var settings = $.extend({
			"visible" : 5,
			"speed" : 500,
			"delay" : 7000,
			"easing" : "linear",
			"block" : "ul li",
			"orientation" : "horizontal",
			"arrows" : {
				"left"  : "left",
				"right" : "right"
					   }
		}, options);
		
		// for the scroll band
		return $( this ).each(function() {
			var element = $(this).find( settings.block );
			var bandSize = $(this).find( settings.block ).length;
			var bandWidth = (settings.orientation == "horizontal") ? $(this).find( settings.block ).outerWidth( true ) : $(this).find( settings.block ).outerHeight( true );
			var currentPosition = 0;
			var visible = settings.visible;
			var insideBandClass = "." + element.parent().attr("class"); /* IT CAN BE UNDEFINED IF NO CLASS SPECIFIED !!! UL MUST ALWAYS HAVE A CLASS */
			var insideBandTagName = element.parent().get(0).tagName.toLowerCase();

			var marginOrientation = (settings.orientation == "horizontal") ? "marginLeft" : "marginTop";
			var marginObject = {};

			if(settings.delay != true)
				var theLongIntervalToGetClear = window.setInterval(function() {$( "a[data-arrows="+ settings.arrows.right +"]" ).trigger("getClick");}, settings.delay);

			
			$(this).find("a[data-arrows]").bind("click getClick", function(event) {

				// clear the interval
				if(settings.delay != true)
					if(event.type == "click") clearInterval( theLongIntervalToGetClear );
			
				if($(this).attr("data-arrows") == settings.arrows.left)
				{
					if(currentPosition != 0)
					{
						currentPosition -= visible;
						var scrollWidth = -bandWidth;
						marginObject[ marginOrientation ] = scrollWidth * currentPosition + "px";
						$( insideBandTagName + insideBandClass ).animate(
							marginObject,
						{
							"duration" : settings.speed,
							"easing" : settings.easing
						});
					}
				}
				else
				{
					currentPosition += visible;
					if(currentPosition < bandSize)
					{
						var scrollWidth = -bandWidth;
						marginObject[ marginOrientation ] = scrollWidth * currentPosition + "px";
						$( insideBandTagName + insideBandClass ).animate(
							marginObject, 
						{
							"duration" : settings.speed,
							"easing" : settings.easing
						});
					}
					else
					{
						marginObject[ marginOrientation ] = 0;
						$( insideBandTagName + insideBandClass ).animate(
							marginObject, 
						{
							"duration" : settings.speed,
							"easing" : settings.easing
						});
						currentPosition = 0;
					}
				}
				return false;
			});
		});
	}
	
}) ( jQuery );

// preload images
$.fn.preload = function() {
    this.each(function(){
        $('<img/>')[0].src = this;
    });
}

jQuery(document).ready(function() {

// Placeholder plugin
(function( $ ){

  $.fn.inputChange = function(word) {
  if (this.val() == '') { this.attr('value',word); }
  return this.each(function(){
        $(this).focus(function() {
            
        if ($(this).val() == word) {
            $(this).attr('value','');
        }
        
        }); 
       
       
       $(this).blur(function(){
            if ($(this).val() == '') {
                $(this).attr('value',word);
            }
        
       });
       
       
        }); 
    

  };
  
  
  
})( jQuery ); //End of plugin declaration


$("input#name").inputChange("Name");
$("input#email").inputChange("Email");
$("textarea#message").inputChange("Message");
$("input#s").inputChange("Search...");


});