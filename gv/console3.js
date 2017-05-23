// open firefox/chrome
// go to http://voice.google.com
// visit legacy google voice
// click add new number
// select a number
// run this script on browser's console panel

var sleep = delay => new Promise(resolve => setTimeout(resolve, delay));

var composeClick = function x(btn) {
  var rect = btn.getBoundingClientRect();
  var x = rect.left + rect.width * Math.random();
  var y = rect.top + rect.height * Math.random();
  const mousedown = new MouseEvent("mousedown", {
    screenX: x + window.screen.availLeft,
    screenY: y + window.screen.availTop,
    clientX: x,
    clientY: y,
  });
  const click = new MouseEvent("click", {
    screenX: x + window.screen.availLeft,
    screenY: y + window.screen.availTop,
    clientX: x,
    clientY: y,
  });
  const mouseup = new MouseEvent("mouseup", {
    screenX: x + window.screen.availLeft,
    screenY: y + window.screen.availTop,
    clientX: x,
    clientY: y,
  });
  btn.dispatchEvent(mousedown);
  return sleep(150 + Math.random() * 30)
    .then(() => {
      btn.dispatchEvent(click);
      return sleep(30 + Math.random() * 30);
    }).then(() => {
      btn.dispatchEvent(mouseup);
    });
}

function task() {
  var btn = document.querySelector(".continueButton");
  if (!btn) {
    alert("Finish");
    return;
  }
  composeClick(btn)
    .then(() => {
      // change sleep time here
      return sleep(500 + Math.random() * 3000);
    })
    .then(() => {
      task();
    });
}
task();
