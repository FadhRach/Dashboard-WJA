// CLICK PAGE

document.addEventListener("DOMContentLoaded", function() {
    var panelHeading = document.getElementById("totaltiket_p");

    panelHeading.addEventListener("click", function() {
        window.location.href = "index.php";
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var panelHeading = document.getElementById("stopclock_p");

    panelHeading.addEventListener("click", function() {
        window.location.href = "tiketstopclock.php";
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var panelHeading = document.getElementById("tiketpm_p");

    panelHeading.addEventListener("click", function() {
        window.location.href = "tiketpmrequest.php";
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var panelHeading = document.getElementById("ggnopen_p");

    panelHeading.addEventListener("click", function() {
        window.location.href = "tiketggnopen.php";
    });
});