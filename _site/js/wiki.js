;(function init() {
if(!window.jQuery) {
    setTimeout(init, 250);
    return;
}
var $ = jQuery,
    defaultUrl = "https://github.com/{{ site.gh.user }}/{{ site.gh.repo }}/wiki/",
    wikiExtension = '.md',
    wikiContainer = '#wiki-content';
function attachWiki(data, textStatus, jqXHR){
    $(wikiContainer).text(data);
};
window.wikiRequest = function(wikiTitle) {
    var url = [defaultUrl,wikiTitle,wikiExtension].join('');
    $.get(url, {}, attachWiki);
};
wikiRequest('Home');
})();
