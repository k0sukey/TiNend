// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
win.open();

// TODO: write your module tests here
var TiNend = require('net.nend.ti');
Ti.API.info("module is => " + TiNend);

var adView = TiNend.createView({
    top: 0,
    left: 0,
    width: 320,
    height: 50,
    nendId: '',
    spotId: '',
    retry: 30
});
win.add(adView);

adView.addEventListener('load', function(){
    Ti.API.info('ad loaded');
});

adView.addEventListener('receive', function(){
    Ti.API.info('ad receiveed');
});

adView.addEventListener('error', function(){
    Ti.API.info('ad load failed');
});
