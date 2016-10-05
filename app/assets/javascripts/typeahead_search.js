var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

var typeahead_search = function(search_provinces, search_walls) {
  $('.typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1}, 
    { name: 'provinces',
      source: substringMatcher(search_provinces),
      templates: {
        header: '<h3 class="typeahead-header">Dove</h3>' 
      }
    },
    { name: 'walls',
      source: substringMatcher(search_walls), 
      templates: {
        header: '<h3 class="typeahead-header">Palestre</h3>'
      }
    }).bind("typeahead:selected", function () {
    $(this).submit();
  });
};
