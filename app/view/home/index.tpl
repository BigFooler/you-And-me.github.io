<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>小公举</title>
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    body {
      background: #000;
      overflow: hidden;
    }

    img {
      width: 100px;
      height: 100px;
    }

    .rib {
      position: absolute;
      width: 200px;
      height: 260px;
      border: solid red;
      border-width: 1px 1px 0 0;
      border-radius: 100% 100% 0/40% 100% 0;
      transition: all 1s;
    }

    .heart {
      position: absolute;
      left: 0;
      right: 0;
      top: 100px;
      bottom: 0;
      width: 200px;
      height: 260px;
      margin: auto;
      transform-style: preserve-3d;
      perspective: 800px;
      animation: rot 15s linear infinite;
    }

    @keyframes rot {
      from {
        transform: rotateY(0deg) rotateX(0deg)
      }

      to {
        transform: rotateY(360deg) rotateX(360deg)
      }
    }

    .cube {
      position: absolute;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      width: 100px;
      height: 100px;
      margin: auto;
      color: red;
      transform-style: preserve-3d;
      transform: translateZ(50px);
    }

    .cube div {
      position: absolute;
      width: 100px;
      height: 100px;
    }

    .cube div:nth-child(1) {
      left: 0;
      top: -100px;
      transform-origin: bottom;
      transform: rotateX(90deg)
    }

    .cube div:nth-child(2) {
      left: 0;
      top: 100px;
      transform-origin: top;
      transform: rotateX(-90deg)
    }

    .cube div:nth-child(3) {
      left: -100px;
      top: 0;
      transform-origin: right;
      transform: rotateY(-90deg)
    }

    .cube div:nth-child(4) {
      left: 100px;
      top: 0;
      transform-origin: left;
      transform: rotateY(90deg)
    }

    .cube div:nth-child(5) {
      left: 0;
      top: 0;
    }

    .cube div:nth-child(6) {
      left: 0;
      top: 0;
      transform: translateZ(-100px)
    }

    .text {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      text-align: center;
    }
    #aa{
      color: #fff;
      font-size: 16px;
      margin: 0 auto;
      line-height: 24px;
    }
  </style>
</head>

<body>
  <div class="text">
    <audio controls autoplay>
      <source src="/public/1.mp3" >
    </audio>
    <div id="aa"></div>
    <div style="display:none" id="w">
      参差荇菜,左右流之
      窈窕淑女,寤寐求之
      愿你三冬暖,愿你春不寒
      愿你天黑有灯，下雨有伞
      愿你善其身，愿你遇良人
      暖色浮余生，有好人相伴
      愿你深情不被辜负
      ---我的姑娘
    </div>
  </div>
  <div class="heart">
    <div class="cube">
      <div><img src="/public/img/1.jpg" alt=""></div>
      <div><img src="/public/img/2.jpg" alt=""></div>
      <div><img src="/public/img/3.jpg" alt=""></div>
      <div><img src="/public/img/4.jpg" alt=""></div>
      <div><img src="/public/img/5.jpg" alt=""></div>
      <div><img src="/public/img/6.jpg" alt=""></div>
    </div>
  </div>
  <script>
    // 随机色
    var getRandomColor = function () {
      return '#' +
        (function (color) {
          return (color += '0123456789abcdef'[Math.floor(Math.random() * 16)])
            && (color.length == 6) ? color : arguments.callee(color);
        })('');
    }
    var index = 0;
    var word = document.getElementById("w").innerHTML;
    function type() {
      document.getElementById("aa").innerText = word.substring(0, index++);
    }
    setInterval(type, 400);
    var heart = document.getElementsByClassName("heart")[0];
    for (var i = 0; i < 36; i++) {
      var oDiv = document.createElement("div");
      oDiv.className = "rib";
      // 画36条心形曲线
      oDiv.style.transform = "rotateY(" + 10 * i + "deg) rotateZ(45deg) translateX(30px)";
      var n = 0;
      setInterval(function () {
        if (n < 36) {
          document.getElementsByClassName('rib')[n].style.borderColor = getRandomColor();
          n = n + 1;
        } else {
          n = 0;
        }
      }, 1000)
      heart.appendChild(oDiv);
    }
  </script>
</body>

</html>