var page = 1;
var maxPage = 9999999999;
var next = document.getElementById('nextlink');
var previous = document.getElementById('previouslink');
getArtists('first');

previous.addEventListener('click', function () {
    getArtists('Prev');
});

next.addEventListener('click', function () {
    getArtists('Next');
});

function getArtists(nextPrev) {

    if (nextPrev == 'Next' && page < maxPage) {
        page += 1;

    } else if (nextPrev == 'Prev' && page > 1) {
        page -= 1;

    } else if (nextPrev == 'first') {

    }

    if (page >= 1 || page <= maxPage) {
        $.getJSON('/ajax/artists/'+page, function(data) {

        })
            .done(function(data){
                maxPage = Math.ceil(data[1]/12);


                $.each( data[0], function( index, artist ) {
                    if ( index == 0 ) {
                        $('#artistContainer').html('<div class="large-2 small-4 left columns" id='+artist.slug+'><a href="/artists/' + artist.slug + '"><img src="'+ artist.avatar_file_name + '" style="border-radius: 15px;"></a></div>').hide().fadeIn(150);
                    } else {
                        $('#artistContainer').append('<div class="large-2 small-4 left columns" id='+artist.slug+'><a href="/artists/' + artist.slug + '"><img src="'+ artist.avatar_file_name + '" style="border-radius: 15px;"></a></div>').hide().fadeIn(150);
                    }
                });

                var pages = "";
                for(var i=1;i<maxPage+1;i++) {
                    if (i == page) {
                        pages += '<em class="current">' + i + '</em>';
                    } else {
                        pages += '<a href="?page=' + i + '">' + i + '</a>';
                    }
                }
                $('#pagination').html('<div class="pagination"><a class="previous_page" id="previouslink">← Anterior</a>' + pages + '<a class="next_page" id="nextlink">Próximo →</a></div>');
            })
            .always(function(){
                next = document.getElementById('nextlink')
                previous = document.getElementById('previouslink')
                artistContainer = document.getElementById('artistContainer')
                pagination = document.getElementById('pagination');
                previous.addEventListener('click', function(){
                    getArtists('Prev');
                })
                next.addEventListener('click',function(){
                    getArtists('Next');
                });
            })

    }
}

