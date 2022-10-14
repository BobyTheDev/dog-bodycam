window.addEventListener("message", function (play) {
    if (play.data.action == "showbodycam") {

        $('.top-right-container').fadeIn();
        $(".top-right-container").css({"display":"flex"})
        document.getElementById("player").innerHTML = play.data.player
        document.getElementById("callsign").innerHTML = play.data.callsign
        document.getElementById("month").innerHTML = play.data.tarih

    }
    else if(play.data.action == "hidebodycam") {
        $('.top-right-container').fadeOut(); 
    } 
    else if(play.data.action == "zamanguncelle") {
        document.getElementById("month").innerHTML = play.data.zaman
    }
});
