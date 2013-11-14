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
//= require jquery
//= require jquery_ujs
//= require_tree .

//Search Elements
var searchBox = document.getElementById('searchBox');
var searchField = document.getElementById('searchField');
var searchIcon = document.getElementById('searchIcon');

//Focusing SearchBox
searchField.addEventListener('focus', function(){
    searchBox.className += ' shadowSearch';
});

searchField.addEventListener('blur', function(){
    searchBox.className = 'searchBox';
});

//Expand SearchBox

searchIcon.addEventListener('click', function() {
    searchBox.className += ' expandedSearch';
    searchField.focus();
})

searchBox.addEventListener('click', function() {
    if (searchBox.className.indexOf('expandedSearch') == -1) {
        searchBox.className += ' expandedSearch';
        searchField.focus();
    }
})

searchField.addEventListener('click', function() {
    if (searchBox.className.indexOf('expandedSearch') == -1) {
        searchBox.className += ' expandedSearch';
        searchField.focus();
    }
})

searchField.addEventListener('blur', function(){
    setTimeout(function() {
        searchField.innerText = '';
    }, 500);
})

