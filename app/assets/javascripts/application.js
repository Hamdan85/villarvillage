// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require modernizr
//= require zepto
//= require foundation.min
//= require jquery
//= require jquery_ujs
//= require_tree .

var page = 1;
var maxPage = 9999999999;
var next = document.getElementById('nextlink');
var previous = document.getElementById('previouslink');

previous.addEventListener('click', getArtists('Prev'));

next.addEventListener('click', getArtists('Next'));

getArtists('first');

function getArtists(nextPrev) {
    console.log(page + '/' + maxPage);
    if (nextPrev == 'Next' && page < maxPage) {
        page += 1;

    } else if (nextPrev == 'Prev' && page > 1) {
        page -= 1;

    } else {

    }

    if (page >= 1 || page <= maxPage) {
        $.getJSON('/ajax/artists/'+page, function(data) {

        })
            .fail(function(data){
                console.log(data);
                console.log('fail');
            })
            .done(function(data){
                maxPage = Math.ceil(data[1]/12);
                populateArtists();

                function populateArtists() {
                    artistContainer.innerHTML = "";
                    $.each( data[0], function( index, artist ) {
                        $('#artistContainer').append('<div class="large-2 small-4 left columns" id='+artist.slug+'><a href="artists/' + artist.slug + '"><img src="'+ artist.avatar_file_name + '" style="border-radius: 15px;"></a></div>').hide().fadeIn('slow');
                    });
                }
                var pages = "";
                for(var i=1;i<maxPage+1;i++) {
                    if (i == page ) {
                        pages += '<em class="current">' + i + '</em>';
                    } else {
                        pages += '<a href="?page=' + i + '">' + i + '</a>';
                    }
                }
                $('#pagination').html('<div class="pagination"><a class="previous_page" id="previouslink">← Anterior</a>' + pages + '<a class="next_page" id="nextlink">Próximo →</a></div>');
            })

    }
}

