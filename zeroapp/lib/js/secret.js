window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
  const args = [1, true, ['bar', 5], {foo: 'baz'}];
  window.flutter_inappwebview.callHandler('myHandlerName', ...args);
});