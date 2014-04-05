// initialize Isotope after all images have loaded
// This stops unloaded images throwing off the layout leading
// to problems like overlapping elements
var $container = $('.movie-list').imagesLoaded( function() {
  $container.isotope({
    itemSelector: '.movie',
    layoutMode: 'masonry',
    sortAscending: false,
    getSortData: {
      average_rating: function(itemElem) {
        var rating = $(itemElem).find('.average-rating').text();
        return parseFloat(rating);
      },
      rt_rating: function(itemElem) {
        var rating = $(itemElem).find('.rt-rating').text();
        return parseFloat(rating);
      },
      imdb_rating: function(itemElem) {
        var rating = $(itemElem).find('.imdb-rating').text();
        return parseFloat(rating);
      },
      metacritic_rating: function(itemElem) {
        var rating = $(itemElem).find('.metacritic-rating').text();
        return parseFloat(rating);
      }
    }
  });
});

$('#sort-menu').on('click', 'button', function() {
  highlightControl($(this).parent(), $(this));

  var sortByValue = $(this).attr('data-sort-by');
  $container.isotope({ sortBy: sortByValue });
});

$('#filter-menu').on('click', 'button', function() {
  highlightControl($(this).parent(), $(this));

  var filterByValue = $(this).attr('data-filter-by');
  $container.isotope({ filter: filterByValue });
});

function highlightControl(menu, button) {
  menu.find("button").css({"color": "#929292", "font-weight": 300});
  button.css({"color": "#B37566", "font-weight": 400});
}
