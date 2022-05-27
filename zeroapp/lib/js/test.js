// window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
//     window.flutter_inappwebview.callHandler('createLongTextShares', 'JS: 我可以接收一串私钥，然后帮你进行一下分片操作')
//       .then(function(result) {     
//         // result 是 Dart给我的私钥  
//         // 这里拿到私钥后进行分片[A, B, C] 
//         let arr = ['A', 'B', 'C'];
//         window.flutter_inappwebview.callHandler(
//           'combineLongTextShares', 'JS: 我把你的私钥分成了3片', arr);
//     });
// });