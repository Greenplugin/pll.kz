/* функция для подключения стилей динамически */
/**
 * StyleFix 1.0.3 & PrefixFree 1.0.7
 * @author Lea Verou
 * MIT license
 */
function CSSLoad(file){
    var link = document.createElement("link");
    link.setAttribute("rel", "stylesheet");
    link.setAttribute("type", "text/css");
    link.setAttribute("href", file);
    document.getElementsByTagName("head")[0].appendChild(link)
}

$(document).ready(function () {

    $("[data-map]").click(function () {
        var ThisElement = $(this);
        console.log(ThisElement.data('map'));
        $('#' + ThisElement.data('map')).on('shown.bs.modal', function () {
            var cityToShow = {};
            var position = ThisElement.data('position').split(',');
            console.log(cityToShow);
            var map = new YMaps.Map(YMaps.jQuery("#YMapsID")[0]);
            var geoPoint = new YMaps.GeoPoint(position[0], position[1]);
            map.setCenter(geoPoint, 14);
            map.openBalloon(geoPoint, ThisElement.data('address'));
            map.enableScrollZoom();
            $(".city-name-and-phone").text(ThisElement.data('name'));
        }).modal();
        CSSLoad('/catalog/view/theme/pll/stylesheet/modal.css');
        return false;
    });
    
/* конец модальное окно */

});
