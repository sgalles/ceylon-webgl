"Run CeylonJS Basic Demo - called after the page loads"
shared void run() {
    dynamic {
        dynamic elem = document.getElementById("contents");
        elem.innerHTML = singlePage();
    }
}

"Single page app"
String singlePage() {
    return "<div>
                <h1>Hello CeylonJS</h1>
                <div id='date-text'>Today is ``date()``</div>
            </div>";
}

"This function is a callback for the HTML button's click event"
shared void updateTime(dynamic eventSource) {
    dynamic {
        dynamic elem = document.getElementById("date-text");
        elem.innerHTML = "Time now: ``date()``";
    }
}

String date() {
    // \iDate is a workaround because both 'Date()' and 'new Date()' exists in JS
    // if we write Date() Ceylon tries to instanciate 
    dynamic { return \iDate(); }
}


