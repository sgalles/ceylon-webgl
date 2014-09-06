"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
    dynamic {
        dynamic elem = document.getElementById("contents");
        elem.innerHTML = singlePage();
    }
}

"Single page app"
String singlePage() {
    dynamic {
        return "<div>
                    <h1>Hello CeylonJS</h1>
                    <div id='date-text'>Today is ``date()``</div>
                </div>";
    }
}

"This function is a callback for the HTML button's click event"
shared void updateTime(dynamic eventSource) {
    dynamic {
        dynamic elem = document.getElementById("date-text");
        elem.innerHTML = "Time now: ``date()``";
    }
}

String date() {
    dynamic { dynamic date = Date; return date().string; }
}
